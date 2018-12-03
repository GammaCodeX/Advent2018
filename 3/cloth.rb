class Cloth
  def initialize
    @squares = {}
    @non_overlapping = []
  end

  def claim(claim)
    @non_overlapping << claim
    claim.each_position do |position|
      square = @squares.fetch(position) { Square.new }
      square.claim(claim)
      @non_overlapping -= square.claimants if square.overlapped?
      @squares[position] = square
    end
  end

  def overlap
    @squares.count { |position, square| square.overlapped? }
  end

  def non_overlap
    @non_overlapping
  end
end

class Square
  def initialize
    @claims = []
  end

  def overlapped?
    @claims.size > 1
  end

  def claim claimant
    @claims += [claimant]
  end

  def claimants
    @claims
  end
end
