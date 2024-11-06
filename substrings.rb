def substrings(word, dictionary)
  word = word.downcase
  dictionary.reduce(Hash.new(0)) do |result, substring|
    result[substring] = word.scan(substring).length if word.include?(substring)
    result
  end
end

dictionary = ["rump", "el", "dent", "rent", "el", "low"]
word = "I can't believe Trump is the president of the United States. I'm moving to Canada."
p substrings(word, dictionary)
#=> {"el"=>1, "lo"=>2, "low"=>1}