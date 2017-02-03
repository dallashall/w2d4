require "byebug"

# O(n^2)
def max_range(arr, w)
  current_max_range = 0
  arr[0..(arr.length - w)].each_index do |i|
    # byebug
    sub_arr = arr[i...(i + w)]
    diff = sub_arr.max - sub_arr.min
    current_max_range = diff if diff > current_max_range
  end
  p current_max_range
end

# p max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue

  attr_reader :size
  def initialize
    @store = []
    @size = 0
  end

  def enqueue(el)
    @store << el
    @size += 1
  end
  def dequeue
    @store.shift
    @size -= 1
  end
  def peek
    @store[0]
  end
  def empty?
    @size == 0
  end
end
class MyStack
  attr_reader :size
  def initialize
    @store = []
    @size = 0
  end
  def pop
    @store.pop
    @size -= 1
  end
  def push(el)
    @store << el
    @size += 1
  end
  def peek
    @store[-1]
  end
  def empty?
    @size == 0
  end
end

class StackQueue
  def initialize
    @input_stack = Stack.new
    @staging_stack = Stack.new
    @output_stack = Stack.new
  end

  def enqueue(el)
    @input_stack.push(el)

  end

  def dequeue

  end
end
