require 'byebug'
# O(n^2)
def my_min_phase1(array)
  array.each_with_index do |num, i|
    return num if array.all?{|num2| num2 >= num}
  end
end

# O(n)
def my_min_p2(array)
  min = array[0]
  array.each_with_index do |num, i|
    min = num if num < min
  end
  min
end

# O(n^2)
def sub_sum_crappy(array)
  results = []
  array.each_with_index do |num1, idx1|
    subs = [num1]
    results << subs.dup
    array[(idx1 + 1)...array.length].each do |num2|
      subs << num2
      results << subs.dup
    end
  end
  results.map do |arr|
    arr.inject(&:+)
  end.max
end
# def sub_sum(array)
#   sum = nil
#   array.each_with_index do |num, idx|
#     temp sum = sum + num
#     sum = temp sum
#
# end

def largest_contiguous_subsum2(arr)
  max = arr[0]
  current = arr[0]
  arr.drop(1).each do |num|
    current += num
    max = current if current > max
    current = 0 if current < 0
  end
  max
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])
