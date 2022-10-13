# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
   #loop from zero to num_1*num_2
   num_1_factors = []
   num_2_factors = []

   gcm= (num_1 * num_2)

   (num_1..gcm).each do |num|
     if num % num_1 == 0
        num_1_factors << num
     end
   end
    (num_2..gcm).each do |num|
     if num % num_2 == 0
        num_2_factors << num
     end
   end

   num_1_factors.each do |num|
        num_2_factors.each do |num2|
            if num == num2 
                return num
            end
        end
   end

end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    substrings = []
    # loop through string

    (0...str.length).each do |i|
        (0...str.length).each do |j|
            substrings << str[i..j]
        end
    end
   substrings_size_two = substrings.select{|substring| substring.length == 2}
    most_substrings(substrings_size_two)
end

def most_substrings(array)
    #most_common_substring = nil
    most_common_substring = nil
    #most_common_count = 0
    most_common_count = 0
    #loop through array
    array.each_with_index do |substring, i|
        #loop through array again
            if array.count(substring) > most_common_count
                most_common_count = array.count(substring)
                most_common_substring = substring
            end
        end
    #return most common_substring
    most_common_substring
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inversed = {}
        self.each do |k,v|
             inversed[v] = k
        end
    inversed
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
      #expect([1, 2, 1, 3, 8].pair_sum_count(5)).to eq(1)
     # expect([10, 3, 6, 5, 7].pair_sum_count(13)).to eq(2)
        # expect([10, 3, 6, 5, 7].pair_sum_count(4)).to eq(0)
    def pair_sum_count(num)
        #define a count
        count = 0
        #loop through array
        i= 0
        j = i+1
            while i < self.length
                while j < self.length
                    if self[i] + self[j] == num
                        count +=1
                    end
                    j +=1
                end
                i+=1
                j = i+1
            end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
            prc ||= Proc.new {|a, b| a <=> b}
        sorted = false
        while !sorted
            sorted = true

            (0...self.length-1).each do |i|
                if prc.call(self[i], self[i+1])==1
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end
        self
    end



end
