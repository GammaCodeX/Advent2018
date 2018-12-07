require_relative 'input'
require_relative 'map'

map = Map.new(400, 400)
map.fill(INPUT)
area_size = map.close_to_all_points(10000)

puts "The safe area has size #{area_size}"


