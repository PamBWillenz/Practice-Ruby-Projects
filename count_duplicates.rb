# Groups numbers by value and counts how many values appear more than once
def countDuplicates(numbers)
  numbers.group_by { |n| n }.count { |k, v| v.size > 1 }
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')