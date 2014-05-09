class Fixnum

  def in_words
    IN_A_WORD[self] || in_hundred(self)
  end

  def digits
    to_s.length
  end

  private
  IN_A_WORD = {
    0  => "zero",
    1  => "one",
    2  => "two",
    3  => "three",
    4  => "four",
    5  => "five",
    6  => "six",
    7  => "seven",
    8  => "eight",
    9  => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }

  MAGNITUDE_WORD = {
    1000000000000 => "trillion",
    1000000000    => "billion",
    1000000       => "million",
    1000          => "thousand",
    100           => "hundred"
  }

  def split_by_unit(n)
    result, n_dump = [], n
    MAGNITUDE_WORD.each do |magnitude, name|
      puts n_dump / magnitude
      result << "#{in_hundred(n_dump / magnitude)} #{name}" if n_dump / magnitude > 0
      n_dump = n_dump % magnitude
    end
    result << in_hundred(n_dump) if n > 0
    result.join(' ')
  end

  def in_hundred(n)
    result = []
    result << IN_A_WORD[n / 10 * 10] if n / 10 > 0
    result << IN_A_WORD[n % 10]
    result.join(' ')
  end

  def over_hunreds(n, unit)
    "#{over_hunreds(n / 100, 'hundred')} #{in_hundred(n % 100)} #{unit}".strip unless n == 0
  end

end