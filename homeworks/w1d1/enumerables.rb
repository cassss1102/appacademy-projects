class Array
  def my_each(&prc)
    for i in 0...self.length
      prc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    result = []
    self.my_each {|num| result << num if prc.call(num)}
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each {|num| result << num unless prc.call(num)}
    result
  end

  def my_any?(&prc)
    self.my_each {|num| return true if prc.call(num)}
    false
  end

  def my_all?(&prc)
    self.my_each {|num| return false unless prc.call(num)}
    true
  end

  def my_flatten
    answer = []
    self.each do |el|
      el.is_a?(Fixnum) ? (answer << el) : (answer.concat(el.my_flatten))
    end
    answer
  end

  def my_zip(*arrays)
    result = []

    self.length.times do |i|
      temp_array = [self[i]]
      arrays.my_each do |array|
        temp_array << array[i]
      end

      result << temp_array
    end

    result
  end

  def my_rotate(n = 1)
    result = self.dup

    if n > 0
      (n % self.length).times do
        value = result.shift
        result << value
      end
    else
      ((n.abs) % self.length).times do
        value = result.pop
        result = [value] + result
      end
    end

    result
  end
end

a = [ "a", "b", "c", "d" ]
p a.my_rotate #== ["b", "c", "d", "a"]
p a.my_rotate(2) #== ["c", "d", "a", "b"]
puts a.my_rotate(-3) #== ["b", "c", "d", "a"]
puts a.my_rotate(15) == ["d", "a", "b", "c"]
