def fizzbuzz(number)
  (1..number).each do |i|
    if (i % 15).zero?
      puts 'fizzbuzz'
    elsif (i % 3).zero?
      puts 'fizz'
    elsif (i % 5).zero?
      puts 'buzz'
    else
      puts i
    end
  end
end
 