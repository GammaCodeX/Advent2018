Claim = Struct.new(:id, :x, :y, :width, :height) do

  def self.from string
    match = /\#(?<id>\d+) @ (?<x>\d+),(?<y>\d+): (?<width>\d+)x(?<height>\d+)/ =~ string # Dont do this at home!
    return nil if match.nil?
    new(id.to_i, x.to_i, y.to_i, width.to_i, height.to_i)
  end
end
