require 'rspec'
require_relative 'map'

describe Map do
  it 'flood fills the map from all points given' do
    # aaaaa.cccc
    # aAaaa.cccc
    # aaaddecccc
    # aadddeccCc
    # ..dDdeeccc
    # bb.deEeecc
    # bBb.eeee..
    # bbb.eeefff
    # bbb.eeffff
    # bbb.ffffFf
    map = Map.new(10,10)
    map.fill([
      "1, 1",
      "1, 6",
      "8, 3",
      "3, 4",
      "5, 5",
      "8, 9"
    ])

    expect(map.largest_size).to eq 17
  end
end
