# Correct the following program so it will work properly. 
# Assume that the Car class has a complete implementation; just make the smallest possible change to ensure that cars have access to the drive method.

# module Drivable
#   def self.drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

module Drivable
  def drive # remove self. from the method definition
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive