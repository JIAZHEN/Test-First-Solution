class Temperature
  def initialize(options = {})
    @f = options[:f] if options[:f]
    @c = options[:c] if options[:c]
  end

  def in_fahrenheit
    @f ? @f : Temperature.ctof(@c)
  end

  def in_celsius
    @c ? @c : Temperature.ftoc(@f)
  end

  def self.from_celsius(c)
    Temperature.new(:c => c)
  end

  def self.from_fahrenheit(f)
    Temperature.new(:f => f)
  end

  def self.ftoc(f)
    (f * 5 - 160).to_f / 9
  end

  def self.ctof(c)
    (9 * c + 160).to_f / 5
  end
end