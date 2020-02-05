nombre = ARGV[0].to_i

puts (1..nombre).reduce(:*)

# (1..nombre).inject(:*)