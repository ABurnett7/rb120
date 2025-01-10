=begin
What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
=end

# My answer:
# attr_accessor :brightness, :color
# We don't seem to have a reason to change the brightness or color after they are set.

# Book answer, kinda attr_accessor, but return in the self.information method because it is redundant, the method will already return that string. 
