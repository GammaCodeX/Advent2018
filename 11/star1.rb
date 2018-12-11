require_relative 'power_cell'

cell = Power_cell.new(3613)
x, y = cell.best_square
power = cell.square(x, y)

puts "The best square is at (#{x},#{y}) and produces #{power} power"
puts "#{cell.level(x+0, y+0)} #{cell.level(x+1, y+0)} #{cell.level(x+2, y+0)}"
puts "#{cell.level(x+0, y+1)} #{cell.level(x+1, y+1)} #{cell.level(x+2, y+1)}"
puts "#{cell.level(x+0, y+2)} #{cell.level(x+1, y+2)} #{cell.level(x+2, y+2)}"
