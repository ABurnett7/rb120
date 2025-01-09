=begin
If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

=end

# My Answer:

# @@cats_count variable is a class variable that is initialized to 0.
# Each time an instance of the Cat class is instantiated, the @@cats_count variable is incremented by 1.
# So we could say that the @@cats_count class variable is a counter that keeps track of how many instances there are of the Cat class.
# The following code will test the theory:

p Cat.cats_count # => 0
my_cat = Cat.new('tabby')
p Cat.cats_count # => 1
my_other_cat = Cat.new('blue')
p Cat.cats_count # => 2

# The output was as expected. 
