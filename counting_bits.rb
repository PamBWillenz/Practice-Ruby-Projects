# This method counts the number of bits set to 1 in the integer
def getOneBits(n)
  count = 0
  while n > 0
    count += 1 if n & 1 == 1
    n >>= 1
  end
  count
end

# This method returns a string with the binary representation of the integer
def getBinaryRepresentation(n)
  n.to_s(2)
end

# Open the file to write our output
fptr = File.open(ENV['OUTPUT_PATH'], 'w')

# Read and parse the input as an integer
n = gets.strip.to_i

# Write the count of set bits to the output file
result = getOneBits n

fptr.write "#{result}\n"

# Iterate over the binary string and write the positions of bits set to 1
bits = getBinaryRepresentation(n)
(0...bits.length).each do |i|
  fptr.write "#{i+1}\n" if bits[i] == '1'
end

# Close the output file
fptr.close()