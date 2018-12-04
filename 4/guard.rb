class Guard

  attr_reader :id

  def initialize(id)
    @id = id
    @sleeps = []
  end

  def start_sleep(minute)
    @start_minute = minute
  end

  def end_sleep(minute)
    sleep = (@start_minute...minute)
    @sleeps << sleep
  end

  def sleep_time_in_minutes
    @sleeps.map(&:size).sum
  end

  def sleeps_at(minute)
    @sleeps.count { |sleep| sleep.include?(minute) }
  end

  def most_sleeps_minute
    (00..59).sort_by do |minute|
      sleeps_at(minute)
    end.last
  end
end

module Guards
  def self.from entries
    current_guard = :no_guard
    guards = {}
    entries.each do |entry|
      /\[(?<timestamp>.*)\] (?<text>.*)/ =~ entry
      match = (/\d\d$/).match(timestamp)
      minutes = match[0].to_i
      case text
      when /Guard #(?<id>\d+) begins shift/
        id = $1.to_i
        guards[id] ||= Guard.new(id)
        current_guard = guards[id]
      when /falls asleep/
        current_guard.start_sleep(minutes)
      when /wakes up/
        current_guard.end_sleep(minutes)
      end
    end
    guards
  end
end
