nombre = ARGV[0].to_i

produit = 1

for n in (1..nombre)
    produit *= n
end
puts produit