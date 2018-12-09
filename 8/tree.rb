class Tree

  attr_reader :data, :children
  def initialize(data)
    n, m = data.next, data.next
    @children = Array.new(n) { Tree.new(data) }
    @data = Array.new(m) { data.next }
  end

  def each_data
    return enum_for(:each_data) unless block_given?

    children.each do |child|
      child.each_data { |data| yield data }
    end
    data.each { |data| yield data }
  end

  def value
    return @data.sum if leaf?
    values = @children.map(&:value)
    data.map do |index|
      (values[index-1] || 0)
    end.sum
  end

  private

  def leaf?
    children.size == 0
  end

  class NullNode
    def value
      0
    end
  end

end
