# Consider the following class definition:

# class Flight
#   attr_accessor :database_handle

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

# There is nothing technically incorrect about this class, but the definition may lead to problems in the future. 
# How can this class be fixed to be resistant to future problems?

class Flight
  # Book solution: Remove the attr_accessor :database_handle so no one uses @database_handle in code.  

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end

  private
  attr_reader :database_handle # my solution, make it still readable to the instance of the class, but to where it can't be messed with by the user. 
end
