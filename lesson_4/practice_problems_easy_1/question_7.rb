=begin
If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

You can see in the make_one_year_older method we have used self. What does self refer to here?
=end

# My answer:
# self refers to the caller, which in this case will be an instance of the Cat class.
# we use self here so ruby knows we want to use the instnace variable setter method for @age, rather than create a local method variable age. 