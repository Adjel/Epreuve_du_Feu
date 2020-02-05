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
x = -1
c3 = c1.flatten

c2.itself.each do |c|
    if c[x] != c3[i]
        x += 1
        puts c[x]
    end
    if c[x] == c3[i+1]
        puts "b"
    end
end

