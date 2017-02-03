require 'byebug'

# O(n^2)
def bad_two_sum?(arr, target)
  arr.each_with_index do |num1, idx1|
    arr[(idx1 + 1)..-1].each_with_index do |num2, idx2|
      return true if num1 + num2 == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
puts "Bad..."
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

#### CANDRA NEEDS TO LOOK AT THESE TWO!
def okay_two_sum?(arr, target)
  sorted = arr.sort
  sorted.each_with_index do |num, idx|
    # byebug
    bidx = sorted.bsearch_index { |num2| target - num <=> num2 } #needs the spaceship for big arrays
    return true if bidx && bidx != idx
  end
  false
end

puts "Okay..."
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # = false

# O(n)
def awesome_two_sum?(arr,target)
  nums = {}
  arr.each do |num|
    # byebug
    return true if nums[num]
    nums[target - num] = num
  end
  false
end
puts "awesome!!"
p awesome_two_sum?(arr, 6) # => should be true
p awesome_two_sum?(arr, 10) # => should be false
