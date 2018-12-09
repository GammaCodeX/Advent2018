require 'rspec'
require_relative 'Game'

describe Game do
  it 'can play round 0-5' do
    game = Game.new(1, 5)

    expect(game.circle).to eq [0, 4, 2, 5, 1, 3]
  end

  it 'scores points when reaching 23 rounds' do
    game = Game.new(9, 23)

    expect(game.high_score).to eq 32
  end

  it 'leaves the game in the correct state after scroing' do
    game = Game.new(9, 25)

    expect(game.circle).to eq [0, 16, 8, 17, 4, 18, 19, 2, 24, 20, 25, 10, 21, 5, 22, 11, 1, 12, 6, 13, 3, 14, 7, 15]
  end

  it 'scores the points to the right player' do
    game = Game.new(9, 25)

    expect(game.players[5]).to eq 32
  end

  it 'highscores the example games correctly' do
    expect(Game.new(10, 1618).high_score).to eq 8317
    expect(Game.new(13, 7999).high_score).to eq 146373
    expect(Game.new(17, 1104).high_score).to eq 2764
    expect(Game.new(21, 6111).high_score).to eq 54718
    expect(Game.new(30, 5807).high_score).to eq 37305
  end

end
