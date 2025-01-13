=begin
The designers of the vehicle management system now want to make an adjustment for how the range of vehicles is calculated. 
For the seaborne vehicles, due to prevailing ocean currents, they want to add an additional 10km of range even if the vehicle is out of fuel.

Alter the code related to vehicles so that the range for autos and motorcycles is still calculated as before, 
but for catamarans and motorboats, the range method will return an additional 10km.
=end


# My Answer:

# Keep the movable module:

# module Moveable
#   attr_accessor :speed, :heading
#   attr_writer :fuel_capacity, :fuel_efficiency

#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end

# and then in the Boats super class, add 10km to the output:

# class Boats
#   include Moveable

#   attr_reader :hull_count, :propeller_count

#   def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
#     @propeller_count = num_propellers
#     @hull_count = num_hulls
#     self.fuel_efficiency = fuel_efficiency
#     self.fuel_capacity = fuel_capacity
#   end

#   def range
#     super + 10
#   end
# end