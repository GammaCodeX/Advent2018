require_relative 'id'

class BoxChecker

  def initialize boxes
    @boxes = boxes.map {|box| Id.new box}
  end

  def close_pair
    @boxes.permutation(2) do |box_1, box_2|
      return [box_1.text, box_2.text] if box_1.distance_to(box_2) == 1
    end
  end

end
