# Using the following code, add a method named share_secret that prints the value of @secret when invoked.

# class Person
#   attr_writer :secret

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret

# Expected output:

# Shh.. this is a secret!

class Person
  attr_writer :secret

  def share_secret
    puts secret 
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret  