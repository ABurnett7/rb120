# Add the appropriate accessor methods to the following code.

# class Person
# end

# person1 = Person.new
# person1.name = 'Jessica'
# puts person1.name

# Expected output:

# Jessica


class Person
  attr_accessor :name
end
person1 = Person.new
person1.name = 'Jessica'
p person1.name == 'Jessica' # true