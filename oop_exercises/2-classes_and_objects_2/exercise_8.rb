# Using the following code, create a class named Person with an instance variable named @secret. 
# Use a setter method to add a value to @secret, then use a getter method to print @secret.

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret

# Expected output:
# Shh.. this is a secret!

class Person 
  def secret=(text)
    @secret = text
  end
  
  def secret 
    @secret
  end
end

# The above can be refactored to :
# class Person 
#   attr_writer :secret
#   attr_reader :secret
# end

# Which can be refactored more to : 
# class Person 
#   attr_accessor :secret
# end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

