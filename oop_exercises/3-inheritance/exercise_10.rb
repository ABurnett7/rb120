# Create a module named Transportation that contains three classes: Vehicle, Truck, and Car. 
# Truck and Car should both inherit from Vehicle.

# module Transportation
#   class Vehicle
#   end

#   class Truck < Vehicle
#   end

#   class Car < Vehicle
#   end
# end

#2nd work through:

module Transportation

  class Vehicle
    attr_reader :year
    
    def initialize(year)
      @year = year
    end
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end

end

truck1 = Transportation::Truck.new(1994)
puts truck1.year # => 1994


car1 = Transportation::Car.new(2006)
puts car1.year # => 2006
