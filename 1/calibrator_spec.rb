require 'rspec'
require_relative 'calibrator'

describe Calibrator do
  it 'starts on frequency 0' do
    calibrator = Calibrator.new []

    expect(calibrator.frequency).to eq 0
  end

  it 'takes a list of adjustments and adjusts the level' do
    calibrator = Calibrator.new [+1, +1, +1]

    expect(calibrator.frequency).to eq 3
  end

  it 'can do negative adjustments' do
    calibrator = Calibrator.new [+1, +1, -2]

    expect(calibrator.frequency).to eq 0
  end

  it 'takes any enumerable input' do
    input = [+1, +2].each
    calibrator = Calibrator.new input

    expect(calibrator.frequency).to eq 3
  end

  it 'can track for repeated frequencies' do
    calibrator = Calibrator.new [+1, -1, +9999]

    expect(calibrator.repeat).to eq 0
  end

  it 'loops (if needed) the input to find a repeat' do
    calibrator = Calibrator.new [+3, +3, +4, -2, -4]

    expect(calibrator.repeat).to eq 10
  end

end
