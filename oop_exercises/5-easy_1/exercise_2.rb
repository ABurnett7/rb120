Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end


# What output does this code print? 


name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name #'Fluffy
puts fluffy #'My name is FLUFFY'
puts fluffy.name #'FLUFFY'
puts name #'FLUFFY'

# Think about any undesirable effects occurring due to the invocation on line 17. 
# Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    upcase_name = @name.upcase
    "My name is #{upcase_name}."
    # Book solution:
    # def to_s
    #   "My name is #{@name.upcase}."
    # end
  end
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # 'Fluffy'
puts fluffy # 'My name is FLUFFY'
puts fluffy.name # 'Fluffy'
puts name # 'Fluffy'


# Further Exploration What's the output when name = 42
name = 42
fluffy = Pet.new(name)
name += 1 
puts fluffy.name # 42
#puts fluffy # no method error: no upcase for an integer
puts fluffy.name # 42
puts name # 43