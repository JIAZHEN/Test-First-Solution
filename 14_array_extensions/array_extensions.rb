class Array

  def sum
    self.reduce(0) { |sum, n| sum += n }
  end

  def square
    self.map { |n| n ** 2 }
  end

  def square!
    self.map! { |n| n ** 2 }
  end

end