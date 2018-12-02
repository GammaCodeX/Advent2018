require 'rspec'
require_relative 'box_checker'

describe BoxChecker do

  it 'Takes a list of boxes as input, and find the pair with distance 1' do
    boxes = ["aaa", "bbb", "abc", "bbb", "ada"]
    checker = BoxChecker.new boxes

    expect(checker.close_pair).to eq ["aaa", "ada"]
  end
end
