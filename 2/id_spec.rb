require 'rspec'
require_relative 'id'

describe Id do

  it 'knows if it contains a duplicate letter' do
    expect(Id.new('aa').duplicate?).to be_truthy
  end

  it 'doest count triplicates as duplicates' do
    expect(Id.new('babbccccc').duplicate?).to be_falsy
  end

  it 'knows if it contains triplicate letters' do
    expect(Id.new('ccc').triplicate?).to be_truthy
  end

  it 'doest count quadruplicate letters as duplicates' do
    expect(Id.new('bbcccac').triplicate?).to be_falsy
  end

  it 'knows the distance to another id' do
    id1 = Id.new 'acdef'
    id2 = Id.new 'abdef'
    #              ^

    expect(id1.distance_to id2).to eq 1
  end

  it 'counts letter under letter' do
    id1 = Id.new 'abcdef'
    id2 = Id.new 'acbdef'
    #              ^^ a single swap makes 2 letters differ

    expect(id1.distance_to id2).to eq 2
  end
end
