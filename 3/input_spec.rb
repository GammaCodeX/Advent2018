require 'rspec'
require_relative 'input'

describe :INPUT do
  it 'contains 1401 claims' do
    expect(INPUT.size).to eq 1401
  end
end

