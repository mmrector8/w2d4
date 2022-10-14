# write a method no_dupes that accepts an array as an arg 
# and returns a new array containing the elements that were not repeated in the array

def no_dupes?(arr)
    no_duped = []
   
    #loop through array
    arr.each do |ele|
        if arr.count(ele) < 2
            no_duped << ele
        end
    end
   no_duped
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


#write a method that acceptsn an array as an arg
#return true if element never appears consecutively
def no_consecutive_repeats?(arr)
    #loop through array
    arr.each_with_index do |ele,i|
        if arr[i] == arr[i+1]
            return false
        end
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    #create an empty hash with values of []
    indices = {}
    #loop through string with index
        str.each_char.with_index do |char, i|
        #if hash does not have k, create it with array with index inside as value
            if !indices.has_key?(char)
                 indices[char] = [i]
            else
                indices[char] << i
            end
        # otherwise shovel index into hash
        end
        #return hash
    indices
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
def longest_streak(str)
    #define a longest_streak empty string
    longest_string = ""
    #loop through string
    count = 0
    i = 0
    while i < str.length
        char = str[i]
            while char == str[i+1]
                count += 1
                i +=1
            end
            i+=1
         #if count > longest_streak.length
         if count > longest_string.length
            last_index = str.rindex(char)
            first_index = str.index(char)
            longest_string = str[first_index..last_index]
         end
         count = 0
    end
    #return longest streak
    return str[-1] if longest_string == ""
    longest_string
end
#  p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

#return a boolean if something is bi prime

#bi prime is pos integer that can only be obtained by multiplying two prime numbers
def bi_prime?(num)

    #loop from 2 up to num
    (2...num).each do |factor|
        #if the number can be divided by a non prime number
        if num % factor == 0 && !prime?(factor)
            return false
        end
    end
    #true
    true
end

def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true
end

# p bi_prime?(14)
# p bi_prime?(20)

def vigenere_cipher(message, keys)
    #define an alphabet constant
    alpha = "abcdefghijklmnopqrstuvqwxyz"
    #define a deciphered key
    deciphered = ""
    #loop through the message
        message.each_char.with_index do |char, idx|
           current_idx = alpha.index(char)
           new_idx = (current_idx + keys[0]) % alpha.length
           keys = keys.rotate
           new_char = alpha[new_idx]
           deciphered += new_char
        end

        deciphered
end

# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


#Proc Problems


class String 

    def select(&blck)
        return "" if blck == nil

        true_letters = []

        self.each_char.with_index do |char, i|
            if blck.call(char)
                true_letters << char
            end
        end
        true_letters.join("")
    end

end

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""