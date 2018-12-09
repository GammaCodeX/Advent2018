class Game

  attr_reader :circle, :players

  def initialize(players, rounds)
    @players = Array.new(players) {0}
    @circle = [0]
    @current = 0
    (1..rounds).each do |i|
      if (i % 23 == 0)
        score(i)
      else
        play(i)
      end
    end
  end

  def high_score
    @players.max
  end

  private

  def score i
    @current = (@current-7) % @circle.size
    score = i + @circle.delete_at(@current)
    @players[i % @players.size] += score
  end

  def play i
    @current = ((@current + 1) % @circle.size) + 1 #Dont question it!
    @circle.insert(@current, i)
  end

end

