class Power_cell
  def initialize (serial_id)
    @s = serial_id
    @data = Array.new(301) {|x| Array.new(301) { |y| calc(x,y) }}
    @table = summed_area_table
  end

  def level(x, y)
    return 0 unless (1..300).cover?(x) && (1..300).cover?(y)
    @data[x][y]
  end

  def square(x, y, size:3)
    x,y = x-1, y-1
    a = @table[x][y]
    b = @table[x+size][y]
    c = @table[x][y+size]
    d = @table[x+size][y+size]
    d+a-b-c
  end

  def best_square(size: 3)
    max_x = 300 - size
    max_y = 300 - size
    best_x, best_y, best_level = 0,0, -999
    (1...max_x).each do |x|
      (1...max_y).each do |y|
        new_level = square(x,y, size: size)
        if new_level > best_level
          best_x, best_y, best_level = x,y, new_level
        end
      end
    end
    [best_x, best_y]
  end

  def best_size
    (1..300).max_by do |size|
      square(*best_square(size: size), size: size)
    end
  end

  private

  def calc(x, y)
    return 0 if x==0 or y==0
    (((x+10)*y+@s)*(x+10)/100 % 10) - 5
  end

  def summed_area_table
    table = Array.new(301) {Array.new(301) {0}}
    (1..300).each do |x|
      (1..300).each do |y|
        table[x][y] =
          level(x,y) +
          table[x-1][y] +
          table[x][y-1] -
          table[x-1][y-1]
      end
    end
    table
  end

end
