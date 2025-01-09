=begin
What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
=end

# My answer: 
# Remove the manual getter and setter methods and use the shortcut attr_accessor.
# Also, remove the @ from the describe_type, because its unneccessary to expose the instance variable there. 

class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

BeesWax.new('yummy type').describe_type # => "I am a yummy type of Beeswax"