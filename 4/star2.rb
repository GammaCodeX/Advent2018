require_relative 'input'
require_relative 'guard'

guards = Guards.from(INPUT).values

guard = guards.sort_by(&:most_sleeps).last

a = guard.id
b = guard.most_sleeps_minute

puts "Guard \##{a} has the most frequently slept minute #{b} (solution #{a*b})"

