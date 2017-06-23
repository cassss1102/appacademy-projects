module Greetable
  def greet
    "Hello, my name is #{self.name}"
  end
end

class Human
  include Greetable

  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

class Robot
  include Greetable

  def name
    "Robot Model #2000"
  end
end

a = Human.new("Dummy")
b = Robot.new

p a.greet
p b.greet
