# Update the following code so that it prints I'm Sophie! when it invokes puts kitty

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty


class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s 
    "I'm #{self.name}!" # "I'm #{name}!" is better I think
  end
end

kitty = Cat.new('Sophie')
puts kitty
puts 