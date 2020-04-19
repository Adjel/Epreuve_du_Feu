fichier1 = File.open("c1.text", "r+")
fichier2 = File.open("c2.text", "r+")

def tab(c)
    c = c.read
    c = c.split(' ')
    c.map! { |c| c = c.split('')}
end

c1 = tab(fichier1)
c2 = tab(fichier2)

print "#{c1}"

c2.each_with_index do |y, y_index|
    y.each_with_index do |x, index|
        if x == c1[0][0]
            puts "#{index},#{y_index}"
            return
        end        
    end
end
