require_relative 'parser'
require_relative 'input'

possible_polymers = ('a'..'z').map do |c|
  Parser.parse(INPUT.gsub(/#{c}/i,''))
end

smallest = possible_polymers.sort_by(&:size).first

puts "the smallest polymer is of length #{smallest.size}"

