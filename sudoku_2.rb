sudoku = File.open("sudoku.txt", "r+")
#sudoku_read = sudoku.read 
tableau = sudoku.read.split('')
tableau = tableau - ["-", "+", "\n", " ", "|"]






# je crée et appelle la méthode qui transforme mon tableau en base de donées à deux dimmensions
def database(tableau)
    tableau.each_with_index do |x, i|
        tableau[i] = tableau[i].to_i
    end
    tableau = tableau.each_slice(9).to_a
end


tableau = database(tableau)
#j'ai obtenu un tableau de mes lignes de sudoku
lines = tableau



#je crée ma méthode qui trouvera mes chiffres manquant dans mes lignes
def empty(data)
    soluce = (1..9).to_a
#on initialise un tableau qui contient les réponses potentielles
    potencial_data = []
    data.each do |ligne|
        potencial_data += [soluce.difference(ligne)]
    end
    return potencial_data
end
#on récupère les chiffres manquand dans les lignes 
potencial_line = empty(tableau)




#je crée ma méthode qui me donnera un tableau des colonnes de mon sudoku
def colonne(tableau)
    count = 0
    index_de_colonne = 0
    colonne = []
    j = -1
    while count < tableau.size - 1
        if j == tableau.size - 1
        j = -1
        count += 1
        index_de_colonne += 1
        end
        tableau[j].each do |x|
            j += 1
            colonne += [tableau[j][index_de_colonne]]
        end
    end
    colonne = colonne.each_slice(9).to_a
    return colonne
end

#on "capture" nos colonnes dans une varibale
colonnes = colonne(tableau)
potencial_column = empty(colonnes)

#je crée une méthode qui me donnera un tableau des carrés du sudoku

def carres(tableau)
    c = 0
    carre = []
    carre[c] ||= []
    carre[c + 1] ||= []
    carre[c + 2] ||= []
    carre[3] ||= []
    carre[4] ||= []
    carre[5] ||= []
    carre[6] ||= []
    carre[7] ||= []
    carre[8] ||= []
    i = 0
    tableau.each do |x|
        if (i > 2 && i < 6)
            c = 3
        elsif (i > 5 && i < 9)
            c = 6
        end
       carre[c] += tableau[i][0..2]
       carre[c + 1] += tableau[i][3..5]
       carre[c + 2] += tableau[i][6..8]
       i += 1
    end
    return carre
end

carres(tableau)
carres = carres(tableau)

#on trouve nos chiffres qui vont dans les cases vides dans nos carrés
potencial_carres = empty(carres)

# je vérifie si mes méthodes sont fonctionnelles (je peux aussi vérifier mes résultats)
#print "#{lines}\n#{colonnes}\n#{carres}\n\n#{potencial_line}\n#{potencial_column}\n#{potencial_carres}"



def potencial_solution(empty, potencial)
    empty.each_with_index do |x, i|
        x.each_with_index do |y, index|
            if y == 0
                empty[i][index] = potencial[i]
            end
        end
    end
    return empty
end

complete_line = potencial_solution(lines, potencial_line)
print complete_line