=begin

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

In the name of the cats_count method we have used self. What does self refer to in this context?
=end

# In this context, self is used to create a class method.  That is, instances of cat won't be able to access it.
# Rather, you'd need to use the class itself to access it.

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
my_cat = Cat.new('tabby')
p Cat.cats_count # => 1
p my_cat.cats_count # => undefined method error
