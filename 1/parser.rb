class Parser

  include Enumerable

  def initialize input
    @numbers = input.each_line.map(&:to_i)
  end

  def each &block
    @numbers.each &block
  end

end
