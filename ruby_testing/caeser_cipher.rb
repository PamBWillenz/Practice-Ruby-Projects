def caeser_cipher(text, shift)
  result = text.chars.map do |char|
    if char =~ /[A-Z]/
      (((char.ord - 65 + shift) % 26) + 65).chr
    elsif char =~ /[a-z]/
      (((char.ord - 97 + shift) % 26) + 97).chr
    else
      char
    end
  end
  result.join
end
