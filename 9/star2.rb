require_relative 'game'

players = 418
rounds = 70769 * 100
high_score = Game.new(players, rounds).high_score

puts "#{players} players; last marble is worth #{rounds} points. Highscore: #{high_score}"
