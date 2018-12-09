class Game

  attr_reader :players

  def initialize(players, rounds)
    @players = Array.new(players) {0}
    @marble = Marble.new(0)
    @origin = @marble
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

  def circle
    marble = @origin
    circle = []
    while(marble.clockwise != @origin) do
      circle << marble.value
      marble = marble.clockwise
    end
    circle + [marble.value]
  end

  private

  def score i
    marble = @marble
      .counter_clockwise
      .counter_clockwise
      .counter_clockwise
      .counter_clockwise
      .counter_clockwise
      .counter_clockwise
      .counter_clockwise
    score = i + marble.delete
    @marble = marble.clockwise
    @players[i % @players.size] += score
  end

  def play i
    @marble = @marble.clockwise.add_after(i)
  end

  class Marble
    attr_accessor :clockwise, :counter_clockwise, :value
    def initialize(i)
      @value = i
      @clockwise = self
      @counter_clockwise = self
    end

    def delete
      clockwise.counter_clockwise = self.counter_clockwise
      counter_clockwise.clockwise = self.clockwise
      value
    end

    def add_after (i)
      new_marble = Marble.new(i)
      clockwise.counter_clockwise = new_marble
      new_marble.clockwise = self.clockwise
      new_marble.counter_clockwise = self
      self.clockwise = new_marble
      new_marble
    end
  end
end

