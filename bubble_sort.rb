# Sorts an array by comparing each consecutive pair of elements and swapping
# them when the left element is greater than the right element.
# The method accepts an optional block specifying the method by which to sort
# the aray (e.g. <tt>{ |left, right| left.length - right.length }</tt> compares
# strings based on length). The result of the block is used to compare the
# elements in the same way as <=>.
# +input+:: The array to be sorted
def bubble_sort(input)
  return 'Please enter an array.' unless input.is_a? Array
  sorted = false
  until sorted
    sorted = true
    for i in 0...input.size - 1
      comparison = block_given? ? yield(input[i], input[i+1]) : input[i] <=> input[i + 1]
      if comparison > 0
        input[i], input[i + 1] = input[i + 1], input[i]
        sorted = false
      end
    end
  end
  input
end
