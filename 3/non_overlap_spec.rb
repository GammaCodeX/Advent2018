require 'rspec'
require_relative 'non_overlap'

describe :non_overlap do
  it 'finds the claim that doesnt overlap any other claims' do
    # ........
    # ...2222.
    # ...2222.
    # .11XX22. #2 and #1 overlaps in these positions
    # .11XX22.
    # .111133. #3 doesnt overlap anything
    # .111133.
    # ........

    claims = [
      Claim.from('#1 @ 1,3: 4x4'),
      Claim.from('#2 @ 3,1: 4x4'),
      Claim.from('#3 @ 5,5: 2x2')
    ]
    expect(non_overlap claims).to eq 3
  end
end
