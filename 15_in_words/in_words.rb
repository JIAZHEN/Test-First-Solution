class Fixnum

  def in_words
    words = []
    words << over_hunreds(self / 1_000_000_000_000, 'trillion')
    words << over_hunreds(self % 1_000_000_000_000 / 1_000_000_000, 'billion')
    words << over_hunreds(self % 1_000_000_000_000 % 1_000_000_000 / 1_000_000, 'million')
    words << over_hunreds(self % 1_000_000_000_000 % 1_000_000_000 % 1_000_000 / 1_000, 'thousand')
    words << over_hunreds(self % 1_000_000_000_000 % 1_000_000_000 % 1_000_000 % 1_000 / 100, 'hundred')
    words << in_hundred(self % 100, self < 100)
    words.compact.join(' ')
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
      when 9
        'nine'
      else
        ''
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
      when 19
        'nineteen'
      else
        ''
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
      when 9
        'ninety'
      else
        ''
      end
    end

    def in_hundred(n, included_zero = false)
      if n.between?(included_zero ? 0 : 1, 9)
        in_ten(n)
      elsif n == 0
        nil
      elsif n.between?(10,19)
        teens(n)
      elsif n % 10 == 0
        tens(n)
      else
        "#{tens(n)} #{in_ten(n % 10)}"
      end
    end

    def over_hunreds(n, unit)
      "#{over_hunreds(n / 100, 'hundred')} #{in_hundred(n % 100)} #{unit}".strip unless n == 0
    end

end