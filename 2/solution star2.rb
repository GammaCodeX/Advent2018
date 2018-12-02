require_relative 'input'
require_relative 'box_checker'
require_relative 'common_substring'

checker = BoxChecker.new INPUT
puts "The closest boxes have common substring #{common_substring(*checker.close_pair)}"
