ARGV.map! do |e|
    e.to_i
end

tab = ARGV
i = 0
    
tab.each do |i|
    while i < tab.size - 1
        if tab[i] < tab[i+1]
            tab[i], tab[i+1] = tab[i+1], tab[i]
            i = 0
        else
        i +=1
        end
    end
end

tab.each do |v|
print " #{v}"
end