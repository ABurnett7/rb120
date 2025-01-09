#Write a class that will display:

# ABC
# xyz

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
  attr_reader :data

  def initialize(string)
    @data = string 
  end

  def uppercase
    self.data.upcase
  end

  def self.lowercase(string)
    string.downcase
  end
end

my_data = Transform.new('abc')
puts my_data
puts my_data.uppercase
puts Transform.lowercase('XYZ')