# frozen_string_literal: true

def caeser_cipher(string, shift)
  string.split('').map do |char|
    shift.times { char = char.next } if char.match(/[a-zA-Z]/)
    char[-1]
  end.join
end

p caeser_cipher('What a string!', 5)
#=> "Bmfy f xywnsl!"
