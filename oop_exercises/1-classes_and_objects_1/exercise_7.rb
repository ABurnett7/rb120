# Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.


class Cat
  #attr_reader :name

  def name # works the same as attr_reader
    @name
  end

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
p kitty.name