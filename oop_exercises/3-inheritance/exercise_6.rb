# Using the following code, create a class named Vehicle that, upon instantiation, assigns the passed in argument to @year. 
# Both Truck and Car should inherit from Vehicle.

# module Towable
#   def tow
#     'I can tow a trailer!'
#   end
# end

# class Truck
#   include Towable
# end

# class Car
# end

# truck1 = Truck.new(1994)
# puts truck1.year
# puts truck1.tow

# car1 = Car.new(2006)
# puts car1.year

# Expected output:

# 1994
# I can tow a trailer!
# 2006

module Towable
  def tow
    'I can tow a trailer!'
  end
end

class Vehicle
  attr_accessor :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  include Towable
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year == 1994
puts truck1.tow == 'I can tow a trailer!'

car1 = Car.new(2006)
puts car1.year == 2006