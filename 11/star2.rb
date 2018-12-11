require_relative 'power_cell'

cell = Power_cell.new(3613)
size = cell.best_size
x, y = cell.best_square(size: size)
power = cell.square(x, y, size: size)

puts "The best square has size #{size} is at (#{x},#{y}) and produces #{power} power"
