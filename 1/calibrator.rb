class Calibrator

  attr_reader :frequency

  def initialize adjustments
    @frequency = adjustments.reduce(0, &:+)
  end

end
