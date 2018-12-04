require_relative 'input'
require_relative 'guard'

guards = Guards.from(INPUT).values

guard = guards.sort_by(&:sleep_time_in_minutes).last

a = guard.id
b = guard.most_sleeps_minute

puts "Guard \##{a} has the most time slept making the best moment to ingress #{b} (solution #{a*b})"

