require 'rspec'
require_relative 'power_cell'

describe Power_cell do
  describe :power_level_at do
    it 'calculates the power level of a coordinate' do
      expect(Power_cell.new(8).level(3, 5)).to eq 4
    end
  end

  describe :power_level_sqare do
    it 'takes an optional argument to specify the size' do
      expect(Power_cell.new(18).square(32, 44, size: 5)).to eq 18
    end

    it 'calculates the power level of picking that 3x3 square' do
      expect(Power_cell.new(42).square(21, 61)).to eq 30
    end

    context 'when size is 1' do
      it 'gives the same value as asking for the power level' do
        cell = Power_cell.new(8)
        expect(cell.square(1, 1, size: 1)).to eq cell.level(1, 1)
        expect(cell.square(1, 2, size: 1)).to eq cell.level(1, 2)
        expect(cell.square(2, 1, size: 1)).to eq cell.level(2, 1)
        expect(cell.square(2, 2, size: 1)).to eq cell.level(2, 2)
        expect(cell.square(3, 5, size: 1)).to eq cell.level(3, 5)
      end
    end

  end

  describe :best_square do
    it 'finds the coordinates of the best square' do
      expect(Power_cell.new(18).best_square).to eq [33, 45]
      expect(Power_cell.new(42).best_square).to eq [21, 61]
    end
  end
end

