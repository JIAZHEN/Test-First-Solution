class Dictionary

  def initialize
    @entries = {}
  end

  def entries
    @entries
  end

  def add(entry)
    if entry.is_a? Hash
      @entries.merge!(entry)
    else
      @entries[entry] = nil
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(key)
    @entries.key?(key)
  end

  def find(str)
    @entries.select { |key, value| key =~ /^#{str}/ }
  end

  def printable
    result = Array.new
    @entries.keys.sort.each { |key| result << %Q{[#{key}] "#{@entries[key]}"} }
    result.join(%Q{\n})
  end

end