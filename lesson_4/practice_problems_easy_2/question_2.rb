=begin
We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future
=end

# My answer:

trip = RoadTrip.new # => instantiates a new instance of the RoadTrip class
trip.predict_the_future # => Returns "You will " + 1/3 choices (chosen at random) from the array in the RoadTrip::choices method.