=begin
When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class with separate names and ages?
=end

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

#My Answer: 
# Instantiate with the appropriate arguments. 

my_cat_1 = AngryCat.new(5, 'Rascal')
my_cat_2 = AngryCat.new(7, 'Stinker')

my_cat_1.age # => 5
my_cat_1.name # => Rascal
my_cat_1.hiss # => Hisssss!!!

my_cat_2.age # => 7
my_cat_2.name # => Stinker
my_cat_2.hiss # => Hisssss!!!
