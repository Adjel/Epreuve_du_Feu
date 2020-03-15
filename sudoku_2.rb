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




=begin
print potencial_column
print "\n #{potencial_line}"
=end



#je crée ma méthode qui trouvera mes chiffres manquant dans mes lignes
def empty(sudoku)
    soluce = (1..9).to_a
   #on initialise un tableau qui contient les réponses potentielles
    potencial_data = []
    sudoku.each do |ligne|
        potencial_data += [soluce.difference(ligne)]
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
#on trouve nos chiffres qui vont dans les cases vides dans nos colonnes
potencial_column = empty(colonnes)


#je crée une méthode qui me donnera un tableau des carrés du sudoku
def carres(tableau)

end
