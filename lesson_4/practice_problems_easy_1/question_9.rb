=begin 

If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end
=end

# My Answer

# To create a new instance of this class you'd need to invoke the #new method on Bag and include 2 arguments 
# one for the color of the bag and another for the bag's material

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

jeans_bag = Bag.new('blue', 'denim')
p jeans_bag # => <Bag:0x00007f5571ed2c40 @color="blue", @material="denim">