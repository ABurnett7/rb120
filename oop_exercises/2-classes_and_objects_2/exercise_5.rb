# Using the following code, create a class named Cat that tracks the number of times a new Cat object is instantiated. 
# The total number of Cat instances should be printed when ::total is invoked.

# kitty1 = Cat.new
# kitty2 = Cat.new

# Cat.total

# Expected output: 
# 2

class Cat 
  @@total_cats = 0

  def initialize
    @@total_cats += 1
  end

  def self.total
    p @@total_cats
  end
end

