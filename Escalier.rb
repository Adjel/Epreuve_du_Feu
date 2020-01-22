i = ARGV[0].to_i
h = 0

i.times do
    i -= 1
    h += 1
    puts (" " * i + "#" * h )
end