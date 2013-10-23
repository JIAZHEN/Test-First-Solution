def echo(words)
	"#{words}"
end

def shout(words)
	"#{words.upcase}"
end

def repeat(words, times = 2)
	("#{words} " * times).strip
end

def start_of_word(words, length)
	words[0, length]
end

def first_word(words)
	words.split.first
end

def titleize(words)
	little_words = ['a', 'an', 'the', 'over', 'and']
	words.split.each_with_index.map do |word, index|
		index == 0 || !(little_words.include? word) ? word.capitalize : word
	end.join(" ")
end