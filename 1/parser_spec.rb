require 'rspec'
require_relative 'parser'

describe Parser do
  it "reads the input as a list of integers" do
    parser = Parser.new <<-EOF
      +1
      +2
      +3
      -1
      -2
      -3
    EOF

    expect(parser.to_a).to eq [1,2,3,-1,-2,-3]
  end

  it "is enumerable" do
    parser = Parser.new <<-EOF
      +1
      +2
      +3
    EOF

    expect(parser.map { |x| x-1 }).to eq [0, 1, 2]
  end
end
