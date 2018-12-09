require_relative 'input'
require_relative 'tree'

tree = Tree.new(INPUT.each)

puts "The sum of all the data in the tree is #{tree.each_data.sum}"
