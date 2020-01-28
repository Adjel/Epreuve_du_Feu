string = ARGV[0]

new_index = 0
new_cle = ""
string.split('').each_with_index do |cle, index|
    if cle != " "
        new_index += 1
    end
    if new_index.even?
        new_cle += cle.upcase
    else
        new_cle += cle.downcase
    end
end
print new_cle  

