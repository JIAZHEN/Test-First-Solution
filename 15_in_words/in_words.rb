class Fixnum

  def in_words
    IN_A_WORD[self] || long_words(self)
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
    1000          => "thousand"
  }

  def long_words(n)
    result, n_dump = [], n
    MAGNITUDE_WORD.each do |magnitude, name|
      result << "#{in_thousand(n_dump / magnitude)} #{name}" if n_dump / magnitude > 0
      n_dump = n_dump % magnitude
    end
    result << in_thousand(n_dump) if n_dump > 0
    result.join(' ')
  end

  def in_thousand(n)
    result = []
    quotient, remainder = n.divmod(100)
    result << IN_A_WORD[quotient] + " hundred" if quotient > 0
    if IN_A_WORD[remainder] && remainder > 0
      result << IN_A_WORD[remainder]
    else
      quotient, remainder = remainder.divmod(10)
      result << IN_A_WORD[quotient * 10] if quotient > 0
      result << IN_A_WORD[remainder] if remainder > 0
    end
    result.join(' ')
  end
end
