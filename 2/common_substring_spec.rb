require 'rspec'
require_relative 'common_substring'

describe :common_substring do
  it 'finds all letters under eachother that are the same' do
    text1 = "abcdefg"
    text2 = "abddefg"

    expect(common_substring(text1, text2)).to eq "abdefg"
  end
end

