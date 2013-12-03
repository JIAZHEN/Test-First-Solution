class Fixnum

  def in_words
    words = []
    words << thousands(self) unless self / 1_000 == 0
    words << hundreds(self) unless (self / 100 == 0 || self % 1_000 == 0)
    if self.between?(0,9)
      words << in_ten(self)
    elsif (self % 100).between?(10, 19)
      words << teens(self % 100)
    elsif (self % 100).between?(1,9)
      words << in_ten(self % 100)
    elsif self % 100 != 0 and self % 1_000 != 0
      words << tens(self % 100)
      words << in_ten(self % 10) unless self % 10 == 0
    end
    words.join(" ")
  end

  private
    def in_ten(n)
      case n
      when 0
        'zero'
      when 1
        'one'
      when 2
        'two'
      when 3
        'three'
      when 4
        'four'
      when 5
        'five'
      when 6
        'six'
      when 7
        'seven'
      when 8
        'eight'
      else
        'nine'
      end
    end

    def teens(n)
      case n
      when 10
        'ten'
      when 11
        'eleven'
      when 12
        'twelve'
      when 13
        'thirteen'
      when 14
        'fourteen'
      when 15
        'fifteen'
      when 16
        'sixteen'
      when 17
        'seventeen'
      when 18
        'eighteen'
      else
        'nineteen'
      end
    end

    def tens(n)
      case n / 10
      when 2
        'twenty'
      when 3
        'thirty'
      when 4
        'forty'
      when 5
        'fifty'
      when 6
        'sixty'
      when 7
        'seventy'
      when 8
        'eighty'
      else
        'ninety'
      end
    end

    def hundreds(n)
      in_ten(n / 100) + ' hundred'
    end

    def thousands(n)
      in_ten(n / 1000) + ' thousand'
    end



end