require_relative 'parser'
require_relative 'input'

puts "the reduced polymer has size #{Parser.parse(INPUT).size}"
