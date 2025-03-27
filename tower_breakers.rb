#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'towerBreakers' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER n
#  2. INTEGER m
#

def towerBreakers(n, m)
  # If towers have height 1, Player 2 wins as Player 1 can't move
  return 2 if m == 1
  
  # If number of towers is even, Player 2 wins by mirroring
  # If number of towers is odd, Player 1 wins with optimal play
  n.even? ? 2 : 1
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.strip.to_i

t.times do |t_itr|
    first_multiple_input = gets.rstrip.split

    n = first_multiple_input[0].to_i

    m = first_multiple_input[1].to_i

    result = towerBreakers n, m

    fptr.write result
    fptr.write "\n"
end

fptr.close()
