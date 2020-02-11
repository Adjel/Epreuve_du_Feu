ARGV[1] = string = File.open(ARGV[1], "r+")

string = string.read.split(" ")
tab_mots = string.map { |c| c = c.split('')}


anagram = ARGV[0].to_s
anagram = anagram.split('')



compteur = 0
lettre_double = 0
mots = []

tab_mots.each_with_index do |string, index_string|
    next if (string.size != anagram.size)
    compteur = 0
    puts "#{string}"
    puts "compteur est à #{compteur}"
    anagram.each_with_index do |lettre, index_lettre|
        puts " #{lettre}"
        lettre_double = 0
        string.each_with_index do |char, index_char|
            if lettre_double >= 2
                compteur -= 1
            end
            puts char
                if lettre == char
                    compteur += 1
                    lettre_double += 1
                    puts "lettre double \= #{lettre_double}"
                end
            puts "compteur \= #{compteur}"
            if compteur == anagram.size
            mots += [string.join]
            compteur = 0
            end 
        end
    end
end

print mots