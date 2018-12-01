require_relative 'calibrator'
require_relative 'parser'
require_relative 'input'

parser = Parser.new INPUT

level = Calibrator.new(parser).repeat

puts "Resulting frequency is #{level}"
