require 'rspec'
require_relative 'parser'

describe Parser do
  it 'can parse a polymer and simplify it' do
    expect(Parser.parse('dabAcCaCBAcCcaDA')).to eq 'dabCBAcaDA'
  end
end
