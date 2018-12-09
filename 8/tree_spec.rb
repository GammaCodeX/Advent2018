require 'rspec'
require_relative 'tree'

describe Tree do

  it 'takes a number of nodes and a number of data' do
    input = [0, 2, 3, 4,]
    #         ^ ^ 2 node header: 0 children 2 data points
    #               ^  ^ the two data points are here

    node = Tree.new(input.each)
    expect(node.data).to eq [3, 4]
  end

  it 'recursively creates all nodes under a tree' do
    input = [2, 3, 0, 3, 10, 11, 12, 1, 1, 0, 1, 99, 2, 1, 1, 2]
    #        ^  ^ root                                  ^  ^  ^
    #              ^  ^   ^   ^   ^ (0)
    #                                ^  ^  (1)       ^
    #                                       ^  ^  ^ (1,0)

    root = Tree.new(input.each)
    expect(root.children.first.data).to eq [10,11,12]
    expect(root.children.last.children.first.data).to eq [99]
  end

  it 'exposes all metadata with an :each_data method' do
    input = [2, 3, 0, 3, 10, 11, 12, 1, 1, 0, 1, 99, 2, 1, 1, 2]
    #        ^  ^ root                                  ^  ^  ^
    #              ^  ^   ^   ^   ^ (0)
    #                                ^  ^  (1)       ^
    #                                       ^  ^  ^ (1,0)

    root = Tree.new(input.each)
    expect(root.each_data.sum).to eq 138
  end

  describe :value do

    it 'is the sum of all metadata entries if node is a leaf' do
      input = [0, 2, 3, 4,]
      #         ^ ^ 2 node header: 0 children 2 data points
      #               ^  ^ the two data points are here

      node = Tree.new(input.each)
      expect(node.value).to eq 7
    end

    it 'is the sum of the indexed children when not a leaf' do
      input = [2, 3, 0, 3, 10, 11, 12, 1, 1, 0, 1, 99, 2, 1, 1, 2]
      #        ^  ^ root                                  ^  ^  ^
      #              ^  ^   ^   ^   ^ (0)
      #                                ^  ^  (1)       ^
      #                                       ^  ^  ^ (1,0)
      #
      #  (1,0): 99
      #  (1): 0 - no child at index 2
      #  (0): 10+11+12 = 33
      #  root: 33 + 33 + 0 = 66

      tree = Tree.new(input.each)
      expect(tree.value).to eq 66
    end

  end

end
