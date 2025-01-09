# Using the code from the previous exercise, add a parameter to #initialize that provides a name for the Cat object. 
# Use an instance variable to print a greeting with the provided name. (You can remove the code that displays I'm a cat!.)


# Expected output:

# Hello! My name is Sophie!



class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{self.name}!"
  end
  def name
    @name
  end
end

kitty = Cat.new('Sophie')