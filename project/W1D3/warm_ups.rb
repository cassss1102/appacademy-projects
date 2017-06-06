def range(first, last)
  return [] if first >= last-1
  range(first, last - 1) << last-1
end
# range(1, 7)

def sum_of_array(arr)
  return arr[0] if arr.length == 1
  p arr[0] + sum_of_array(arr[1..-1])
end

# sum_of_array([1,2,3,4,5,6])

def sum_of_array_1(arr)
  answer = 0
  arr.each { |num| answer += num }
  answer
end

# sum_of_array_1([1,2,3])

def exp(b, n)
  return 1 if n == 0
  return b if n == 1
b * exp(b, n - 1)
end

# p exp(2, 1)
# p exp(2, 0)
# p exp(2, 3)

def exp_2(b, n)
  return 1 if n == 0
  return b if n == 1
  n.even? ? exp_2(b, n / 2) ** 2 : b * (exp_2(b, (n - 1) / 2) ** 2)
end

# p exp_2(2, 1)
# p exp_2(2, 0)
# p exp_2(2, 3)

def fib(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  prev = fib(n - 1)
  value = prev[-1] + prev[-2]
  p fib(n-1) << value
end

def deep_dup(arr)
  array_copy = []
  arr.each do |el|
    if el.is_a?(Array)
      array_copy.push(deep_dup(el))
    else
      array_copy << el
    end
  end
  array_copy
end

# test = [1, [2], [3, [4]]]
# deep_dup(test)
# p test

def subsets(arr)
  return [[]] if arr.empty?
  prev_subsets = subsets(arr[0...-1])
  prev_subsets.map { |sets| sets << arr[-1] }
  subsets(arr[0...-1]) + prev_subsets
end

# p subsets([1,2,3])

def permutations(arr)
  return [arr] if arr.length <= 1
  prev_permutations = permutations(arr[0...-1])
  result = []
  prev_permutations.each do |permutation|
    (permutation.length + 1).times do |idx|
      result << permutation[0...idx] + [arr.last] + permutation[idx..-1]
    end
  end

  result
end

# p permutations([1, 2, 3])

def bsearch(arr, target)
  half_length = (arr.length / 2)
  comp_val = arr[arr.length/2]
  return comp_val if arr[comp_val] == target

  arr_lower = arr[0..half_length]
  arr_upper = arr[half_length..-1]
  if comp_val < target
    bsearch(arr_upper, target)
  elsif comp_val > target
    bsearch(arr_lower, target)
  end
  nil
end

p bsearch([1, 2, 3, 4, 5, 7], 5)
