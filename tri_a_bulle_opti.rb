ARGV.map!{|e| e.to_i}
tab = ARGV


i = 0
    
while i < tab.count - 1 do
    if tab[i] < tab[i+1]
        tab[i], tab[i+1] = tab[i+1], tab[i]
        i = 0
    else
    i +=1
    end
end    

tab.each {|v| print " #{v}" }