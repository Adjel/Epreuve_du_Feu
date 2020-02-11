#  mots = File.new("fr.text", "w")
#  mots.puts("amour", "arbre", "balade", "barre", "beau")

string = File.open("fr.text", "r+" )

string = string.read.split(" ")

=begin
tab_mots = []
string.map do |mot|
    tab_mots += [[mot]]
end
=end

anagram = "arbre"
anagram = anagram.split('')

tab_mots = string.map { |c| c = c.split('')}






=begin
tab_mots.each_with_index do |string, index_string|
    string.each_with_index do |char, index_char|
        anagram.each_with_index do |lettre,index_lettre|
            if char == lettre
                index_char += 1
                if index_char == string.size
                    print string
                end
            elsif
                char != lettre
                index_lettre += 1 
                if index_lettre == anagram.size
                    index_string += 1
                end
            end
        end
    end
end
=end


=begin
tab_mots.each_with_index do |string, index_string|
    string.each_with_index do |char, index_char|
        puts "    #{char}"
        anagram.each_with_index do |lettre,index_lettre|
            if char == lettre
                index_char += 1
                puts char
                if (index_lettre == anagram.size) && (index_char == string.size)
                    print string
                end
            else
                index_lettre += 1
            end
        end
    end
end
=end

i = 0
tab_mots.each_with_index do |string, index_string|
    string.each_with_index do |char, index_char|
        if char != anagram[i]
            i += 1
            if i == anagram.size
                index_string += 1
            end
        else
            index_char += 1
            if i == anagram.size
                puts string
            end
        end
    end
end


