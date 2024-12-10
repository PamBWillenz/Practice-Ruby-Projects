# frozen_string_literal: true

def substrings(word, dictionary)
  word = word.downcase
  dictionary.each_with_object(Hash.new(0)) do |substring, result|
    result[substring] = word.scan(substring).length if word.include?(substring)
  end
end

dictionary = %w[rump el dent rent el low]
word = "I can't believe Trump is the president of the United States. I'm moving to Canada."
p substrings(word, dictionary)
#=> {"el"=>1, "lo"=>2, "low"=>1}
