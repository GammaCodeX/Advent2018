require 'rspec'
require_relative 'plan'

describe Plan do
  let (:plan) {
    Plan.new([
      'Step C must be finished before step A can begin.',
      'Step C must be finished before step F can begin.',
      'Step A must be finished before step B can begin.',
      'Step A must be finished before step D can begin.',
      'Step B must be finished before step E can begin.',
      'Step D must be finished before step E can begin.',
      'Step F must be finished before step E can begin.'
    ])
  }

  it 'creates a record of all nodes' do
    expect(plan.nodes).to eq %w{A B C D E F}
  end

  it 'knows what step to do first' do
    expect(plan.next_step).to eq 'C'
  end

  it 'updates the list of steps when performing a step' do
    plan.perform_next_step
    expect(plan.perform_next_step).to eq 'A' # A before F because alphabet
    expect(plan.next_step).to eq 'B' # B before F because alphabet
  end

  it 'can stream the entire plan in order' do
    expect(plan.stream.to_a.join).to eq 'CABDFE'
  end

  it 'can return all available steps' do
    plan.started('C')
    plan.completed('C')
    expect(plan.next_steps).to eq ['A','F']
    plan.started('A')
    plan.started('F')
    plan.completed('A')
    expect(plan.next_steps).to eq ['B', 'D']
    # F is already started and should no longer be reported
  end

end

