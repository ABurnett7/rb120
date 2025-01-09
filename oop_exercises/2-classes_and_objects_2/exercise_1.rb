# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

# class Cat
# end

# Cat.generic_greeting => Hello! I'm a cat!

class Cat
  
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
p kitty.class
kitty.class.generic_greeting