# Given the following class:

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# Write a class called Square that inherits from Rectangle, and is used like this:

# square = Square.new(5)
# puts "area of square = #{square.area}"


class Square < Rectangle
  def initialize(side)
    @height = side
    @width = side
  end
end

square = Square.new(5)
puts "area of square = #{square.area}" # area of square = 25