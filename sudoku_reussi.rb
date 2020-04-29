#tableau = ARGV[0]

tableau = File.open("hard_sudoku.txt", "r+").read
data = tableau.split('') - ["-", "+", "\n", " ", "|"]

data.each_with_index do |x, i|
    data[i] = data[i].to_i
end

sudoku = data.each_slice(9).to_a


complete = Array.new(9) { Array.new(9) {[1, 2, 3, 4, 5, 6, 7 , 8, 9]} }


# foncion qui définit mes réponses potentielles dans mes lignes, et supprime les chiffres déjà existants
def check_line(sudoku, complete)

    for line in 0..8
        for i in 0..8
            

            # si ma case dans ma ligne est vide, je mets dans mon array de réponses potentielles (à la même place que ma case vide) tous les chiffres qui ne sont pas dans ma ligne
            if sudoku[line][i] == 0
                for n_line in 0..8
                    complete[line][i] -= [sudoku[line][n_line]]
                end

                # si ma réponse potentielle est unique (j'ai trouvé le bon chiffre) je remplace la case vide par le chiffre trouvé 
                if complete[line][i].size == 1
                    sudoku[line][i] = complete[line][i][0]
                   
                end


            else
                # si ma case n'est pas vide je supprime toute réponse potentielle, puisque j'ai déjà une réponse
                complete[line][i] = []
            end
        end
    end
    return sudoku

end




# foncion qui définit mes réponses potentielles dans mes colonnes, et supprime les chiffres déjà existants
def check_col(sudoku, complete)

    for col in 0..8
        for line in 0...sudoku[col].length


            # si ma case est vide (dans ma colonne) je retire tous les chiffres existants déjà dans mon sudoku de mes réponses potentielles
            if sudoku[line][col] == 0
                for n_line in 0...sudoku[col].length
                    complete[line][col] -= [sudoku[n_line][col]]
                end

                # si ma réponse potentielle est unique (j'ai trouvé le bon chiffre) je remplace la case vide par le chiffre trouvé
                if complete[line][col].size == 1
                    sudoku[line][col] = complete[line][col][0]
                    
                end


            else
                # si ma case n'est pas vide je supprime toute réponse potentielle, puisque j'ai déjà une réponse
                complete[line][col] = [] 
            end
        end
    end
    return sudoku

end




# foncion qui définit mes réponses potentielles dans mes carrés, et supprime les chiffres déjà existants
def check_block(sudoku, complete)

    # je parcours une fois chaque case de chaque carré
    for block_line in [0,3,6]
        for column in [0,3,6]

            line = (block_line / 3) * 3
            col = (column / 3) * 3
            for i in line..line + 2
                for c in col..col + 2

                    # si ma case est vide (dans mon carré) je retire tous les chiffres existants déjà dans mon sudoku de mes réponses potentielles
                    #print "\nBUG #{sudoku[i][c]}"
                    if sudoku[i][c] == 0
                        for n_line in line..line + 2
                            for n_col in col..col + 2
                                complete[i][c] -= [sudoku[n_line][n_col]]
                            end
                        end


                        # si ma réponse potentielle est unique (j'ai trouvé le bon chiffre) je remplace la case vide par le chiffre trouvé
                        if complete[i][c].size == 1
                            sudoku[i][c] = complete[i][c][0]

                        end

                    # si ma case n'est pas vide je supprime toute réponse potentielle, puisque j'ai déjà une réponse
                    else
                        complete[i][c] = []
                    end
                end
            end
        end
    end
    return sudoku

end

def uniq_in_line(sudoku, complete)

    # si mon chiffre apparait une seule fois dans ma ligne potentielle, alors c'est le bon chiffre (il est déjà apparu dans mes 2 lignes qui forment le block de 3 lignes potentielles )
    # lorsque j'ai un bon chiffre je remplace la case lui correspondant dans le sudoku (grâce à l'index)
    #sinon je passe à la ligne suivante

    complete.each_with_index do |line, i|
            
        line.each_with_index do |potencial_numbers, j|
            
            potencial_numbers.each_with_index do |uniq_number, k|

                #je vais vérifier mes potentielles réponses et supprimer celles qui ont été ajouté lors de l'appel de la fonction uniq_in_line
                check_solutions(sudoku, complete)
              
                if line.flatten.count(uniq_number) == 1 && complete[i][j][k] != nil && complete[i][j][k] != [nil]
                    sudoku[i][j] = complete[i][j][k]

                end
            end
        end
    end
    return sudoku

end


def uniq_in_column(sudoku, complete)
    # idem que uniq_line dans mes colonnes

    #on instancie et modifie l'array complete qui devient complete_columns afin de pouvoir trouver notre chiffre unique dans les colonnes
    complete_columns ||= []

    for col in 0..8

        for line in 0..8

            complete_columns[col]||= []
            complete_columns[col][line] ||= []

            complete_columns[col][line] += complete[line][col]
        end

    end


        #on utilise la même méthode que pour les lignes
        complete_columns.each_with_index do |line, i|
          
            line.each_with_index do |potencial_numbers, j|
            
                potencial_numbers.each_with_index do |uniq_number, k|

                #je vais vérifier mes potentielles réponses et supprimer celles qui ont été ajouté lors de l'appel de la fonction uniq_in_column
                check_solutions(sudoku, complete)
                
                    if line.flatten.count(uniq_number) == 1 && complete_columns[i][j][k] != nil && complete_columns[i][j][k] != [nil] 
                        sudoku[j][i] = complete_columns[i][j][k]
                    end
                end
            end
        end
        return sudoku


end


def check_solutions(sudoku, complete)

    check_line(sudoku, complete)
    check_col(sudoku, complete)
    check_block(sudoku, complete)

end

def sudoku_solution(sudoku, complete)

    check_solutions(sudoku, complete)
    uniq_in_line(sudoku, complete)
    uniq_in_column(sudoku, complete)
    return sudoku

end


def sudoku_solved(sudoku, complete)

    full = false
    i = 0

    while i < 81 && full == false
        

        for line in 0..8
            for col in 0..8

                full = true
                
                if sudoku[line][col] == 0
                    potencial_solve(sudoku, complete)
                    full = false
                    i = 0
                else
                    i += 1
                end
            end
        end
        
    end
end


def print_my_complete_sudoku(sudoku, complete)

    sudoku_solution(sudoku, complete)

    for line in 0...sudoku.count
        for col in 0...sudoku[line].count

            if col % 9 == 0 && line % 3 == 0 && line > 1
                print "\n---+---+---\n"
            elsif col % 3 == 0 && col > 0
                print "|"
            elsif col % 9 == 0 
                print "\n"
            end
            print sudoku[line][col]

        end
    end
    print "\n\n"

end

print_my_complete_sudoku(sudoku, complete)