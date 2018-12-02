class Id

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

  private

  def talley(enumerable)
    enumerable.reduce({}) do |talley, value|
      talley[value] = talley.fetch(value){0} + 1
      talley
    end
  end

end
