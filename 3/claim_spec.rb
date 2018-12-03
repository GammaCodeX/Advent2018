require 'rspec'
require_relative 'claim'

describe Claim do
  it 'can be instantiated from raw string form' do
    claim = Claim.from  '#16 @ 53,389: 12x15'

    expect(claim.id).to eq 16
    expect(claim.x).to eq 53
    expect(claim.y).to eq 389
    expect(claim.width).to eq 12
    expect(claim.height).to eq 15
  end
end

