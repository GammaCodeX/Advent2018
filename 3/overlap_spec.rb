require 'rspec'
require_relative 'overlap'
require_relative 'claim'

describe :overlap do
  it 'finds the number of sqares that overlap' do
    # ........
    # ...2222.
    # ...2222.
    # .11XX22.
    # .11XX22.
    # .111133.
    # .111133.
    # ........

    claims = [
      Claim.from('#1 @ 1,3: 4x4'),
      Claim.from('#2 @ 3,1: 4x4'),
      Claim.from('#3 @ 5,5: 2x2')
    ]
    expect(overlap claims).to eq 4
  end

  it 'doesnt count already overlapping squares twice' do
    # .....
    # .1X2. # (2,1) is tripple claimed
    # ..3.. #
    # .....

    claims = [
      Claim.from('#1 @ 1,1: 2x1'),
      Claim.from('#2 @ 2,1: 2x1'),
      Claim.from('#3 @ 2,1: 1x2')
    ]
    expect(overlap claims).to eq 1
  end

end
