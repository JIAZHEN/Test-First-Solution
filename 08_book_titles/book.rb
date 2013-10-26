class Book
  def title=(title)
    @title = titleize(title)
  end

  def title
    @title
  end

  def titleize(words)
    little_words = ['a', 'an', 'the', 'over', 'and', 'in', 'of']
    words.split.each_with_index.map do |word, index|
      index == 0 || !(little_words.include? word) ? word.capitalize : word
    end.join(" ")
  end
end