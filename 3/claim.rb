require_relative 'point'

Claim = Struct.new(:id, :x, :y, :width, :height) do

  def self.from string
    match = /\#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<width>\d+)x(?<height>\d+)/ =~ string # Dont do this at home!
    return nil if match.nil?
    new(id.to_i, x.to_i, y.to_i, width.to_i, height.to_i)
  end

  def each_position
    return enum_for(:each_position) unless block_given?
    (x...x+width).each do |x|
      (y...y+height).each do |y|
        yield Point.new(x,y)
      end
    end
  end

end
