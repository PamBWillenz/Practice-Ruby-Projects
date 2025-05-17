require_relative 'hashmap'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# Overwrite a few nodes
test.set('apple', 'green')
test.set('banana', 'brown')
test.set('lion', 'yellow')

puts "Length before adding last node: #{test.length}"
puts "Capacity before adding last node: #{test.capacity}"

# Add one more node to trigger resize
test.set('monkey', 'gray')

puts "Length after adding last node: #{test.length}"
puts "Capacity after adding last node: #{test.capacity}"

# Test get
puts "Get apple: #{test.get('apple')}"      # green
puts "Get banana: #{test.get('banana')}"    # brown
puts "Get lion: #{test.get('lion')}"        # yellow
puts "Get monkey: #{test.get('monkey')}"    # gray
puts "Get missing: #{test.get('missing')}"  # nil

# Test has?
puts "Has apple? #{test.has?('apple')}"     # true
puts "Has monkey? #{test.has?('monkey')}"   # true
puts "Has missing? #{test.has?('missing')}" # false

# Test remove
test.remove('apple')
puts "Has apple after remove? #{test.has?('apple')}" # false
puts "Length after removing apple: #{test.length}"

# Test keys, values, entries
puts "Keys: #{test.keys.inspect}"
puts "Values: #{test.values.inspect}"
puts "Entries: #{test.entries.inspect}"

# Test clear
test.clear
puts "Length after clear: #{test.length}"
puts "Keys after clear: #{test.keys.inspect}"
