def substrings(string, dictionary)
  split_string = string.split
  dictionary_hash = dictionary.map { |key| [key, 0] }.to_h
  # iterate through every dictionary_hash word
  dictionary_hash.each do |key, val|  
    # iterate through every split_string word
    split_string.each do |word|
      # if the key from the dictionary_hash is a substring of a word, increment it's value
      if word.downcase.include?(key.downcase)
        dictionary_hash[key] += 1
      end
    end
  end
  # remove entries where value == 0
  dictionary_hash.delete_if { |key, value| value == 0 }
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)
