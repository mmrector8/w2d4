# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    # define a returnpair_arr
    pair_arr = []
    #make words into an array
        #loop through array
        words.each_with_index do |word, i|
            words.each_with_index do |word2, j|
                if j >i
                    if contain_all_vowels?(word, word2)
                        pair_str = word + " " + word2
                        pair_arr << pair_str
                    end
                end
            end
        end 
        pair_arr
end

#define a method that checks if two words contain all vowels
def contain_all_vowels?(word1, word2)
    #define a vowels array.
    vowels = ["a", "e", "i", "o", "u"]
    #define a count
    count = 0
    word_arr = word1.split("") + word2.split("")
    word_arr.select!{|char| char != ""}
    #
    #if the two words array contain all vlowels
        if vowels.all?{|char| word_arr.include?(char)}
            return true
        end
    #return true
     false
end 

# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    #loop from zero to num
    (2...num).each do |factor|
        if num % factor == 0
            return true
        end 
    end
  false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    #define a return array
    bigrams_arr = []
    #make string into an array of words,
    str_arr = str.split(" ")
        #loop through words
        bigrams.each do |bigram|
            str_arr.each do |word|
                if word.include?(bigram)
                    bigrams_arr << bigram
                end
            end
        end
      bigrams_arr.uniq
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select      
  # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new {|k, v| k == v }
        #define a return hash
        selected_hash= Hash.new(0)
        #loop through hash
        self.each do |k,v|
            if prc.call(k,v)
                selected_hash[k] = v
            end
        end
        selected_hash
    end

end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        substring_arr = []
        #define an empty substring arr
        #loop through string
        i = 0
        j = 0
        while i < self.length
           
            while j < self.length
            #loop through string again
                substring_arr << self[i..j]
                j+=1
                
            end
            i+=1
            j = 0
         end
       if length == nil 
            return substring_arr.select{|ele| ele != ""}
        else
            substring_arr.select{|ele| ele.length == length}
        end
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        #define an alphabet
        alphabet= "abcdefghijklmnopqrstuvwxyz"
        #define a return string
        deciphered = ""
        #loop through string with index
            self.each_char.with_index do |char, idx|
                current_idx = alphabet.index(char)
                new_idx = (current_idx + num)% alphabet.length
                new_char = alphabet[new_idx]
                deciphered += new_char
            end
           deciphered
    end
end
