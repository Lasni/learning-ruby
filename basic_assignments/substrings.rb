# frozen_string_literal: true

def substrings(string, dictionary)
  split_string = string.split
  dictionary_hash = dictionary.to_h { |key| [key, 0] }
  # iterate through every dictionary_hash word
  dictionary_hash.each_key do |key|
    # iterate through every split_string word
    split_string.each do |word|
      # if the key from the dictionary_hash is a substring of a word, increment it's value
      dictionary_hash[key] += 1 if word.downcase.include?(key.downcase)
    end
  end
  # remove entries where value == 0
  dictionary_hash.delete_if { |_key, value| value.zero? }
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
p substrings("Howdy partner, sit down! How's it going?", dictionary)
