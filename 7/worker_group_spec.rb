require 'rspec'
require_relative 'worker_group'
require_relative 'plan'

describe WorkerGroup do

  it 'reports the time it will take to work on a task' do
    workers = WorkerGroup.new(1)
    workers.work_on ['A']

    expect(workers.time_completed).to eq 61
  end

  it 'updates the plan with the work done' do
    plan = Plan.new(['Step A must be finished before step B can begin.'])
    workers = WorkerGroup.new(1, plan: plan)
    workers.work_on ['A']

    expect(plan.next_step).to eq 'B'
  end


  it 'can work on tasks in sequence' do
    workers = WorkerGroup.new(1)
    workers.work_on ['C'] # 63
    workers.work_on ['D'] # 64

    expect(workers.time_completed).to eq 127
  end

  it 'can work on multiple tasks in parallel' do
    workers = WorkerGroup.new(5)
    workers.work_on ['C', 'D'] # 63 and 64

    expect(workers.time_completed).to eq 64
  end

  it 'will work on as many tasks as it can in each iteration' do
    plan = Plan.new([
      'Step B must be finished before step C can begin.',
      'Step C must be finished before step D can begin.',
      'Step D must be finished before step E can begin.',
      'Step F must be finished before step E can begin.'
    ])
    # t=0   A B and F can be taken (but only enough workers for A and B)
    # t=61  A is complete B 1 minute from, w1
    #       F only available task, w1 is 66 from complete
    # t=62  B complete C available, w2 takes C (63 from complete) w1 has 65 minutes to complete
    # t=125 C complete D available, w2 takes D (64 from complete) w1 has 2 minutes to complete
    # t=127 F complete nothing available w1 sleeps, w2 has 62 minutes left)
    # t=189 D complete E available, whoever takes it is ready in 65 minutes
    # t=254 complete!
    workers = WorkerGroup.new(2, plan: plan)

    while(plan.more?) do
      workers.work_on(plan.next_steps)
    end

    expect(workers.time_completed).to eq 254
  end

end

