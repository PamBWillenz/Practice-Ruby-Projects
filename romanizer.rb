def romanizer(numbers)
  # Check if the input is an array
  if numbers.is_a?(Array)
    numbers.map do |num|
      num = num.to_i
      roman = ""
      map = {
        1000=>"M", 900=>"CM", 500=>"D", 400=>"CD", 100=>"C",
        90=>"XC", 50=>"L", 40=>"XL", 10=>"X", 9=>"IX",
        5=>"V", 4=>"IV", 1=>"I"
      }
      # Convert each element to integer, build Roman numeral
      map.each do |value, symbol|
        while num >= value
          roman << symbol
          num -= value
        end
      end
      roman
    end
  else
    # Otherwise, handle single integer input
    numbers = numbers.to_i
    roman = ""
    map = {
      1000=>"M", 900=>"CM", 500=>"D", 400=>"CD", 100=>"C",
      90=>"XC", 50=>"L", 40=>"XL", 10=>"X", 9=>"IX",
      5=>"V", 4=>"IV", 1=>"I"
    }
    # Convert integer to Roman numeral using the map
    map.each do |value, symbol|
      while numbers >= value
        roman << symbol
        numbers -= value
      end
    end
    roman
  end
end

# Open output file
ftpr = File.open(ENV['OUTPUT_PATH'], 'w')