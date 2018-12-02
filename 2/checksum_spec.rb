require 'rspec'
require_relative 'checksum'

describe :checksum do
  it 'takes a list of box names and produces the checksum' do
    boxes = ['aa', 'bb', 'cc', 'ddd', 'eee'] # 3 duplicates 2 triplicates

    expect(checksum(boxes)).to eq(6)
  end
end
