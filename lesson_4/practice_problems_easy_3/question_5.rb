=begin
If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

What would happen if I called the methods like shown below?

=end

tv = Television.new # Creates a new instance of the Television class
tv.manufacturer # Error, undefined method for tv object
tv.model # method executes

Television.manufacturer # method executes
Television.model # error, undefined method for Television class