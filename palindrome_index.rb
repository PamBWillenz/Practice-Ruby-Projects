#!/bin/ruby

require 'json'
require 'stringio'
# Complete the 'palindromeIndex' function below.
#
# The function is expected to return an INTEGER.
# The function accepts STRING s as parameter.
#

def palindromeIndex(s)
  left = 0
  right = s.length - 1
  
  # Check if already a palindrome
  return -1 if s == s.reverse
  
  while left < right
    if s[left] != s[right]
      # Try removing character at left position
      if is_palindrome(s, left + 1, right)
        return left
      end
      
      # Try removing character at right position
      if is_palindrome(s, left, right - 1)
        return right
      end
      
      # If neither removal creates a palindrome
      return -1
    end
    
    left += 1
    right -= 1
  end
  
  return -1
end

# Helper method to check if substring is palindrome
def is_palindrome(s, left, right)
  while left < right
    return false if s[left] != s[right]
    left += 1
    right -= 1
  end
  true
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')