# frozen_string_literal: true

def caesar_cipher(string, shift)
  string.chars.map { |char| shift_char(char, shift) }.join
end

def shift_char(char, shift)
  char_num = char.ord

  if char.between?('A', 'Z')
    shift_within_range(char_num, shift, 65, 90)
  elsif char.between?('a', 'z')
    shift_within_range(char_num, shift, 97, 122)
  else
    char
  end
end

def shift_within_range(char_num, shift, range_start, range_end)
  shifted_char_num = char_num + shift

  if shifted_char_num > range_end
    (((shifted_char_num - range_start) % 26) + range_start).chr
  else
    shifted_char_num.chr
  end
end

def caesar_cipher2(string, shift)
  ciphered_string = ''

  string.each_char do |char|
    char_num = char.ord

    shifted_char = if char.between?('A', 'Z')
                     (((char_num - 65 + shift) % 26) + 65).chr
                   elsif char.between?('a', 'z')
                     (((char_num - 97 + shift) % 26) + 97).chr
                   else
                     char
                   end

    ciphered_string += shifted_char
  end

  ciphered_string
end

puts caesar_cipher('Hello, World!', 5)
puts caesar_cipher2('Hello, World!', 5)
