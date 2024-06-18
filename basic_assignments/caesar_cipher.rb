def caesar_cipher(string, shift)
  ciphered_string = ''
  string.split('').each do |char|

    char_num = char.ord
    shifted_char_num = char_num + shift

    # handling A - Z
    if char_num.between?(65, 90)
      if  shifted_char_num > 90
        # handling cases that need to wrap
        wrapped_char_num = (shifted_char_num - 65) % 26 + 65
        ciphered_string += wrapped_char_num.chr
      else
        ciphered_string += shifted_char_num.chr
      end

    # handling a - z
    elsif char_num.between?(97, 122)
      if shifted_char_num > 122
        # handling cases that need to wrap
        wrapped_char_num = (shifted_char_num - 97) % 26 + 97
        ciphered_string += wrapped_char_num.chr
      else
        ciphered_string += shifted_char_num.chr
      end

    # handling non-letter values
    else
      ciphered_string += char
    end

  end
  ciphered_string
end

def caesar_cipher2(string, shift)
  ciphered_string = ''

  string.each_char do |char|
    char_num = char.ord

    if char.between?('A', 'Z')
      shifted_char = ((char_num - 65 + shift) % 26 + 65).chr
    elsif char.between?('a', 'z')
      shifted_char = ((char_num - 97 + shift) % 26 + 97).chr
    else
      shifted_char = char
    end

    ciphered_string += shifted_char
  end

  ciphered_string
end

puts(caesar_cipher('Hello, World!', 5))
puts(caesar_cipher2('Hello, World!', 5))
