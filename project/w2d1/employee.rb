require 'byebug'
class Employee
  attr_reader :name, :salary, :boss, :title

  def initialize(name, salary, title, boss = nil)
    @name, @salary, @boss, @title = name, salary, boss, title
    boss.subordinates << self if boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :subordinates

  def initialize(name, salary, title, boss)
    @subordinates = []
    super
  end

  def bonus(multiplier)

    # return salary if self.subordinates.empty?
    total = 0
    @subordinates.each do |employee|
      #debugger
      if !employee.is_a?(Manager)
        total += employee.salary * multiplier
      else
        total += employee.salary * multiplier
        total += employee.bonus(multiplier)
      end
    end

    total
  end
end

ned = Manager.new("ned", 1000000, "Founder", nil,)
darren = Manager.new("Darren", 78000, "TA Manager",	ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)

# p darren.subordinates.map(&:name)
# p ned.subordinates.map(&:name)
# p darren.boss.name

# puts ned.name
# puts ned.salary
# puts ned.title
# puts ned.boss


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
p shawna.bonus(3)
