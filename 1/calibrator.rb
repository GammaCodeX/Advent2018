class Calibrator

  def initialize adjustments
    @adjustments = adjustments
  end

  def frequency
    @adjustments.reduce(0, &:+)
  end

  def repeat
    found_numbers = {}
    current_level = 0
    adjustments = @adjustments.each

    loop do
      return current_level if found_numbers[current_level]
      found_numbers[current_level] = true
      current_level += looping_next(adjustments)
    end
  end

  private

  def looping_next(enumerator)
    begin
      enumerator.next
    rescue StopIteration
      enumerator.rewind
      enumerator.next
    end
  end


end
