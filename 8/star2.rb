require_relative 'input'
require_relative 'tree'

tree = Tree.new(INPUT.each)

puts "The value of the tree is #{tree.value}"
