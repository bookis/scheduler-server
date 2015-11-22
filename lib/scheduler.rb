class Scheduler
  attr_accessor :times, :every_n_minutes, :send_first_at
  def initialize(attrs)
    @times = attrs[:times]
    @send_first_at = attrs[:send_first_at]
    @every_n_minutes = attrs[:every_n_minutes]
  end

  def schedules
    @schedules ||= generate_schedules(times, send_first_at, every_n_minutes)
  end

  def generate_schedules(n, time, minutes, schedules=[])
    return schedules if n == 0
    schedules << {send_at: time}
    generate_schedules(n-1, time + minutes, minutes, schedules)
  end
end
