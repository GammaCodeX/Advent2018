require_relative 'plan'
require_relative 'input'
require_relative 'worker_group'

plan = Plan.new(INPUT)
workers = WorkerGroup.new(5, plan: plan)
while (plan.more?) do
  workers.work_on plan.next_steps
end


puts "The total time to complete was #{workers.time_completed}"
