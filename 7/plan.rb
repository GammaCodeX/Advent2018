class Plan

  attr_reader :nodes

  def initialize(rules)
    @rules = rules.map { |string| Rule.from string }
    @nodes = @rules.map(&:before) | @rules.map(&:after)
    @nodes.sort!
    @active_tasks = []
  end

  def next_step
    next_steps.first
  end

  def next_steps
    (@nodes - @active_tasks).select do |step|
      !@rules.any? { |rule| step == rule.after }
    end
  end

  def perform_next_step
    completed next_step
  end

  def perform_next_steps
    next_steps.map { |step| perform step }
  end

  def stream
    return enum_for(:stream) unless block_given?

    while(more?) do
      yield perform_next_step
    end
  end

  def more?
    @nodes.size > 0
  end

  def started step
    @active_tasks |= [step]
  end

  def completed step
    @active_tasks -= [step]
    @nodes -= [step]
    @rules = @rules.reject do |rule|
      rule.before == step
    end
    step
  end

end

class Rule

  attr_reader :before, :after
  def initialize(before, after)
    @before = before
    @after = after
  end

  def self.from(string)
    /Step (?<before>.) must be finished before step (?<after>.) can begin\./ =~ string
    new(before, after)
  end
end
