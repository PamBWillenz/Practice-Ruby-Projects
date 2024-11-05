def caeser_cipher(string, shift)
  string.split("").map do |char|
    if char.match(/[a-zA-Z]/)
      shift.times { char = char.next }
    end
    char[-1]
  end.join
end

p caeser_cipher("What a string!", 5)
#=> "Bmfy f xywnsl!"