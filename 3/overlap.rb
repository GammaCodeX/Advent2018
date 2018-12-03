require_relative 'claim'

def overlap claims
  cloth = Cloth.new

  claims.each.with_index do |claim,index|
    (claim.x...claim.x + claim.width).each do |x|
      (claim.y...claim.y + claim.height).each do |y|
        cloth.claim(x,y)
      end
    end
  end
  cloth.overlap
end

class Cloth

  def initialize
    @squares = {}
  end

  def claim(x,y)
    position = Point.new(x,y)
    @squares[position] = @squares.fetch(position){0} + 1

  end

  def overlap
    @squares.count { |key,value| value > 1 }
  end

end

Point = Struct.new(:x, :y)

