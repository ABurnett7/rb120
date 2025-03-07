=begin
Below we have 3 classes: Student, Graduate, and Undergraduate. The implementation details for the #initialize methods in Graduate and Undergraduate are missing. Fill in those missing details so that the following requirements are fulfilled:

Graduate students have the option to use on-campus parking, while Undergraduate students do not.

Graduate and Undergraduate students both have a name and year associated with them.

Note, you can do this by adding or altering no more than 5 lines of code.

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate
  def initialize(name, year, parking)
  end
end

class Undergraduate
  def initialize(name, year)
  end
end
=end

# My solution with 2 lines added / altered and 4 removed. 

class Student
  def initialize(name, year, parking)
    @name = name
    @year = year
    @parking = parking # a boolean
  end
end

class Graduate < Student
  def initialize(name, year, parking)
  end
end

class Undergraduate < Student
  def initialize(name, year, parking)
  end
end