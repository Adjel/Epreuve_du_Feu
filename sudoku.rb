=begin
ligne = %W(1 9 5 7 8 4 2)
colonne = %w(7 5 9 2 8 6 1 4)

solution = %w(1 2 3 4 5 6 7 8 9)


puts solution.difference(colonne)
=end


tableau = File.open("sudoku.txt", "r+")
tableau = tableau.read.split('')
tableau = tableau - ["-", "+", "\n", " ", "|"]

tableau.each_with_index do |x, i|
    tableau[i] = tableau[i].to_i
end

tableau = tableau.each_slice(9).to_a





def case_vide(tableau, ligne)
    nombre = []
    for chiffre_manquant in (1..9)
        if chiffre_manquant != tableau[ligne]
            nombre = [chiffre_manquant]   
        end
        chiffre_manquant = nombre.difference(tableau[ligne])
        return chiffre_manquant
    end
end



def colonne(tableau, index_de_colonne)
    colonne = []
    j = -1
    tableau[j].each do |x|
        j += 1
        colonne += [tableau[j][index_de_colonne]]
    end
    return colonne
end



def colonne_vide(ligne)
    index_chiffre = -1
    nombre = []
    for chiffre_manquant in (1..9)
        index_chiffre += 1
        if chiffre_manquant != ligne[index_chiffre]
            nombre = [chiffre_manquant]
        end
        chiffre_manquant = nombre.difference(ligne)
        return chiffre_manquant
    end
end







case_vide(tableau, 0)
colonne(tableau, 4)

colonne_4 = colonne(tableau, 4)
puts "#{colonne_4}"

colonne_vide(colonne_4)






#puts tableau.inspect