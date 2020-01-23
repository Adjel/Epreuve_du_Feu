mes_espaces = ARGV[0].to_i

for diese in (1..mes_espaces)
    mes_espaces -= 1
        puts " " * mes_espaces + ("#" * diese)
    end
