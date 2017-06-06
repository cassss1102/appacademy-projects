require "byebug"

def bsearch(array, target)
  return nil if array.empty?
  mid_idx = array.length / 2
  return mid_idx if array[mid_idx] == target
  # debugger
  # idx_array = (0..array.length).to_a
  array_left = array[0...mid_idx]
  array_right = array[(mid_idx + 1)..-1]
  # if array[mid_idx] == target
  if array[mid_idx] > target
    bsearch(array_left, target)
  else
    search_results = bsearch(array_right, target)
    search_results.nil? ? nil : search_results + mid_idx + 1
  end
end

# puts bsearch([1,2,3,4,5,6], 1)
# p bsearch([1,2,3,4,5,6], 2)
# p bsearch([1,2,3,4,5,6], 3)
# p bsearch([1,2,3,4,5,6], 4)
# p bsearch([1,2,3,4,5,6], 5)
p bsearch([1,2,3,4,5,6], 6)
