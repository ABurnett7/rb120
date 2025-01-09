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

Which one of these is a class method (if any) and how do you know? How would you call a class method?
=end

# My Answer

# The manufacture method is a class method.  
# To create a class method, the method needs to begin with 'def self.method_name'
# To call a class method invoke the method name on the class (Television.manufacturer)
