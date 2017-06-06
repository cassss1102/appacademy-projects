def sum_to(n)
  return nil if n <= 0
  return 1 if n == 1
  n + sum_to(n - 1)
end


def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1 

  nums_array.shift + add_numbers(nums_array)
end

  p add_numbers([1,2,3,4]) # => returns 10
  p add_numbers([3]) # => returns 3
  p add_numbers([-80,34,7]) # => returns -39
  p add_numbers([]) # => returns nil
def gamma_fnc(n)
  if n < 1
    return nil
  elsif n == 1
    return 1
  else
    gamma_fnc(n - 1) * (n - 1)
  end

end

def ice_cream_shop(flavors, favorite)
  return false if flavors.length == 0
  flavor = flavors.shift
  return true if flavor == favorite

  ice_cream_shop(flavors, favorite)

end
puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  == false
puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea') #== true
puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio') == false
puts ice_cream_shop(['moose tracks'], 'moose tracks') == true
puts ice_cream_shop([], 'honey lavender') == false


def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0..-2])
end
