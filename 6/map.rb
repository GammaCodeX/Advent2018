class Map

  def initialize(x, y)
    @x = x
    @y = y
    @points
  end

  def fill(points)
    @points = points.map do |string|
      Point.from(string)
    end
  end

  def largest_size
    finite = @points.reject do |origin|
      # if an origin is also the point closest to any edge the region is not finite
      each_edge_point.any? { |edge| is_closest_to(origin, edge) }
    end
    finite.map { |start_point|
      each_position.count do |point|
        is_closest_to(start_point, point)
      end
    }.max
  end

  def close_to_all_points(distance)
    each_position.count do |point|
      sum_distance_to_origins(point) <= distance
    end
  end

  private

  def is_closest_to(candidate_point, point)
    distances = @points.map { |starting_point| starting_point.distance_to(point) }
    return false if distances.min(2).reduce(:==) # Multiple points are closest to this!
    candidate_point.distance_to(point) == distances.min
  end

  def each_position
    return enum_for(:each_position) unless block_given?
    (0...@x).each do |x|
      (0...@y).each do |y|
        yield Point.new(x,y)
      end
    end
  end

  def each_edge_point
    return enum_for(:each_edge_point) unless block_given?
    (0...@y).each do |y|
      yield Point.new(0,    y) #Left side
      yield Point.new(@x-1, y) #Right side
    end
    (0...@x).each do |x|
      yield Point.new(x,    0) #Top side
      yield Point.new(x, @y-1) #Bottom side
    end
  end

  def sum_distance_to_origins(point)
    @points.reduce(0) do |sum, origin|
      sum + origin.distance_to(point)
    end
  end

end

Point = Struct.new(:x, :y) do

  def self.from string
      /(?<x>\d+), (?<y>\d+)/ =~ string
      new(x.to_i, y.to_i)
  end

  def neighbours
    [
      Point.new(x + 1, y    ),
      Point.new(x - 1, y    ),
      Point.new(x    , y - 1),
      Point.new(x    , y + 1)
    ]
  end

  def to_s
    "(#{x}, #{y})"
  end

  def distance_to other
    (self.x - other.x).magnitude + (self.y - other.y).magnitude
  end

end



