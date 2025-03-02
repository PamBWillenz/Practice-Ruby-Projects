def getLargestNumber(num)
  digits = num.to_s.chars
  
  # Separate 3s and 0s from other digits
  threes = digits.select { |d| d == "3" }
  zeros = digits.select { |d| d == "0" }
  others = digits.reject { |d| d == "3" || d == "0" }
  
  # Group and sort remaining digits
  groups = others.chunk(&:itself).map(&:last)
  sorted_groups = groups.sort_by { |g| -g.first.to_i }
  
  # Combine in specific order: sorted groups, zeros, threes
  (sorted_groups.flatten + zeros + threes).join
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')
fptr.write getLargestNumber(gets.strip)
fptr.close