=begin
You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future
=end

# My answer:

oracle = Oracle.new # => instantiates a new instance of the Oracle class
oracle.predict_the_future # => No output, but will return "You will " + 1/3 choices (chosen at random) from the array in the choices method. 