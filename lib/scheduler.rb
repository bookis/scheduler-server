class Scheduler
  attr_accessor :times, :every_n_minutes, :send_first_at
  def initialize(attrs, options={})
    @times = attrs[:times]
    @send_first_at = attrs[:send_first_at]
    @every_n_minutes = attrs[:every_n_minutes]
    @after = options[:after]
  end

  def schedules
    @schedules ||= generate_schedules(times, send_first_at, every_n_minutes)
  end

  def generate_schedules(n, time, minutes, schedules=[])
    return schedules if n == 0
    if !@after || time > @after
      schedules << {send_at: time}
    end
    generate_schedules(n-1, time + minutes, minutes, schedules)
  end
end
