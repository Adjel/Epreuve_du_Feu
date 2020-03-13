tableau = File.open("sudoku.txt", "r+")
tableau = tableau.read.split('')
tableau = tableau - ["-", "+", "\n", " ", "|"]






# je crée et appelle la méthode qui transforme mon tableau en base de donées à deux dimmensions
def database(tableau)
    tableau.each_with_index do |x, i|
        tableau[i] = tableau[i].to_i
    end
    tableau = tableau.each_slice(9).to_a
end
tableau = database(tableau)








#je crée ma méthode qui trouvera mes chiffres manquant dans mes lignes
def empty(sudoku)
    soluce = (1..9).to_a
   #on initialise un tableau qui contient les réponses potentielles
    potencial_data = []
    sudoku.each do |ligne|
        potencial_data += [soluce.difference(ligne)]
    end
    return potencial_data
end


#on récupère les chiffres manquand dans les lignes 
potencial_line = empty(tableau)








=begin
#on crée les colonnes
def colonne(tableau)
    colonne = []
    i = 0
    tableau.each_with_index do |chiffres, index|
        colonne += [tableau[index][i]]
    end
    while i != tableau.size
        i += 1
        
    end
    print colonne
end
=end

def colonne(tableau)
    count = 0
    index_de_colonne = 0
    colonne = []
    j = -1
    while count < tableau.size - 1
        if j == 8
            j = -1
            count += 1
            index_de_colonne += 1
        end
        tableau[j].each do |x|
            j += 1
            puts tableau[j][index_de_colonne]
            colonne += [tableau[j][index_de_colonne]]
        end
    end
    return colonne
end


colonne(tableau)