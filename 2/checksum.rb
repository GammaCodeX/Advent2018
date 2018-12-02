require_relative 'id'

def checksum(list_of_boxes)
  ids = list_of_boxes.map {|box| Id.new box}
  triplicates = ids.count(&:triplicate?)
  duplicates = ids.count(&:duplicate?)

  return triplicates * duplicates
end
