=begin
Which of these two classes would create objects that would have an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
=end

# My Answer
# Pizza would.  This is because when an instance of Pizza is instatiated, the instance variable @name is created.
# When an instance of Fruit is instantiated a local method variable name is created. 

# Book goes further with this cool method:

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

p hot_pizza.instance_variables # => [:@name]
p orange.instance_variables # => []