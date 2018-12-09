require_relative 'plan'
require_relative 'input'

plan = Plan.new(INPUT)

puts "The order of the instructions are #{plan.stream.to_a.join}"
