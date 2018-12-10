class Sky

  def initialize(particles)
    @particles = particles.map { |string| Particle.for(string) }
  end

  def render_at(
    time: 0,
    x: positions(time).map(&:x).min,
    y: positions(time).map(&:y).min,
    width: required_width(time),
    height: required_height(time)
  )
    data = Array.new(height) {'.' * width}
    positions(time).each do |position|
      index_x = position.x - x
      index_y = position.y - y
      next if index_y >= data.size
      next if index_x >= data[0].size
      data[index_y][index_x] = '#'
    end
    data.join("\n")
  end

  def required_width(time)
    xs = positions(time).map(&:x)
    1 + xs.max - xs.min
  end

  def required_height(time)
    ys = positions(time).map(&:y)
    1 + ys.max - ys.min
  end

  def time_of_smallest_height(time_range)
    time_range.min_by do |time|
      required_height(time)
    end
  end

  def time_of_smallest_width(time_range)
    time_range.min_by do |time|
      required_width(time)
    end
  end

  def positions(time)
    @particles.map { |particle| particle.position_at(time) }
  end

  private

  Vector = Struct.new(:x, :y) do
    def *(num)
      Vector.new(x * num, y * num)
    end

    def +(other)
      Vector.new(self.x + other.x, self.y + other.y)
    end

  end

  class Particle
    @VECTOR_REGEX = /<\s*(-?\d+),\s*(-?\d+)/
    def self.for(string)
      initial, velocity = string.scan(@VECTOR_REGEX).map do |x,y|
        Vector.new(x.to_i, y.to_i)
      end
      new(initial, velocity)
    end

    def initialize(initial, velocity)
      @initial = initial
      @velocity = velocity
    end

    def position_at(time)
      @initial + @velocity * time
    end

  end

end




