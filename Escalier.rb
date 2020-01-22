mes_espaces = ARGV[0].to_i
diese = 0

mes_espaces.times do
    mes_espaces -= 1
    diese += 1
    puts (" " * mes_espaces + "#" * diese )
end