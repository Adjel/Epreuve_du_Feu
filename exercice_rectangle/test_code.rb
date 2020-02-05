=begin
Dir::mkdir("test", 0777)
File::new("test/c1.txt", "w+")

c1 = fichier1.read
c2 = fichier2.read

c1 = c1.split(' ')
c2 = c2.split(' ')

tab_c2 = []                             tab_c1 = c1.combination(1).to_a
c2.each do |v|          ---->           tab_c2 = c2.combination(1).to_a
    tab_c2 += [[v]]   
end


i = 0
i_s = 0
c1[i].each do |i_t|
    print i_t[i_s]
    i_s +=1
end

["123", "321", "123"]
 c1 = [[1, 2, 3], [3, 2, 1], [1, 2, 3]]
 c2[["9", "3", "0", "8", "7", "0"], ["0", "8", "1", "2", "3", "5"], ["9", "7", "3", "2", "1", "7"], ["0", "9", "1", "2", "3", "0"], ["8", "8", "3", "7", "0", "0"]]

c.map! { |c| c = c.split('')}

=end

fichier1 = File.open("c1.text", "r+")
fichier2 = File.open("c2.text", "r+")

def tab(c)
    c = c.read
    c = c.split(' ')
    c.map! { |c| c = c.split('')}
end

c1 = tab(fichier1)
c2 = tab(fichier2)




i = 0
c3 = c1.flatten

c2.each do |y|
    y.each_with_index do |x, index|
        if x == c3[i]
            i += 1
            puts " x\=#{x}  index\=#{index}  i\=#{i}"
        else
            puts "c'est inegal puts x\=#{x}  index\=#{index}"
        end
    end
end


