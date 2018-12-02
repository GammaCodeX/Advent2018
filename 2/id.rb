class Id

  attr_accessor :text

  def initialize text
    @text = text
    @talley = talley(text.split(''))
  end

  def duplicate?
    @talley.values.include? 2
  end

  def triplicate?
    @talley.values.include? 3
  end

  def distance_to other
    other.text.each_char.zip(text.each_char).count {|a,b| a != b}
  end

  private

  def talley(enumerable)
    enumerable.reduce({}) do |talley, value|
      talley[value] = talley.fetch(value){0} + 1
      talley
    end
  end
end
