require_relative 'input'
require_relative 'map'

map = Map.new(400, 400)
map.fill(INPUT)
largest = map.largest_size()

puts "The largest area has size #{largest}"


