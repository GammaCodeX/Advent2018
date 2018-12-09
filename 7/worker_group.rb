require_relative 'plan'

class WorkerGroup
  def initialize(size, plan: Plan.new([]))
    @plan = plan
    @time = 0
    @workers = Array.new(size) { Worker.new }
  end

  def work_on(tasks)
    available_workers.zip(tasks).each do |worker, task|
      break unless task
      @plan.started(task)
      worker.take(task, @time)
    end

    fast_forward
  end

  def time_completed
    @workers.map(&:time_ready).max
  end

  private

  def fast_forward
    @time = busy_workers.map(&:time_ready).min
    @workers.select { |worker| worker.time_ready == @time }.each do |worker|
      @plan.completed(worker.task)
    end
  end

  def available_workers
    @workers.select { |worker| worker.busy?(@time) }
  end

  def busy_workers
    @workers - available_workers
  end

  def queue task
    @plan.started(task)
    @time += time(task)
    @plan.completed(task)
  end

end

class Worker
  @@ALPHABET = ('A'..'Z').to_a

  attr_reader :time_ready, :task

  def initialize
    @time_ready = 0
  end

  def take(task, time)
    @time_ready = time + time(task)
    @task = task
  end

  def busy?(time)
    time >= @time_ready
  end

  private

  def time(task)
    @@ALPHABET.index(task) + 61
  end

end
