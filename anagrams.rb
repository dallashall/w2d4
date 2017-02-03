require 'byebug'
#O(n!)

def first_anagram?(string1,string2)
  anagrams = string1.chars.permutation.to_a.map(&:join) #=> O(n) + O(n!) + O(n) + O(n^2)
  anagrams.include?(string2) #=> + O(n)
end

puts "First:"
p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
p first_anagram?("elvisabcd", "lives")

# O(n^2)
def second_anagram?(string1,string2)
  letters1 = string1.chars
  letters2 = string2.chars
  letters1.each_with_index do |letter1,idx1|
    letters2.each_with_index do |letter2, idx2|
      if letter1 == letter2
        # debugger
        letters1[idx1] = nil
        letters2[idx2] = nil
      end
    end
  end
  letters2.compact.empty? && letters1.compact.empty?
end
puts "Second:"
p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
p second_anagram?("sdjflsajflsajlsjflsjlajfljajlfwaoiueiwourwone", "hfkjashkhakfhawiehgiuwahvbaevwofvoeaivbawna")

# nlogn   =>> n + n(log n) + n + n(log n)
def third_anagram?(string1, string2)
  string1.chars.sort == string2.chars.sort
end
puts "Third:"
p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true
p third_anagram?("sdjflsajflsajlsjflsjlajfljajlfwaoiueiwourwone", "hfkjashkhakfhawiehgiuwahvbaevwofvoeaivbawna")

#O(n)
def fourth_anagram?(string1,string2)
  frequency = Hash.new(0)
  
  string1.each_char do |char| #O(n)
    frequency[char] += 1
  end
  string2.each_char do |char| #O(n)
    frequency[char] -= 1
  end
  frequency.values.all? {|value| value == 0} #O(n) + O(n)
end
puts "Here comes the Fourth!"
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("sdjflsajflsajlsjflsjlajfljajlfwaoiueiwourwone", "hfkjashkhakfhawiehgiuwahvbaevwofvoeaivbawna")
