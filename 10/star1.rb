require_relative 'input'
require_relative 'sky'

sky = Sky.new(INPUT)

puts "Scanning timeline (next 20k seconds) for the moment most likely to contain a message"
moment = sky.time_of_smallest_height(0..20_000)

puts "This is the sky at T=#{moment}"
puts sky.render_at(time: moment)



