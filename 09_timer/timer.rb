class Timer
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end

  def time_string
    ss = padded(@seconds % 60)
    mm = padded(@seconds / 60 % 60)
    hh = padded(@seconds / 3600)
    "#{hh}:#{mm}:#{ss}"
  end

  def padded(n)
    n < 10 ? '0' + n.to_s : n.to_s
  end
end