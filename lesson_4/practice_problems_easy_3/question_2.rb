=begin
In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

If we call Hello.hi we get an error message. How would you fix this?
=end

# My answer:
# To not get an error message, there would need to be a class method ::hi in the Hello class.

class Hello < Greeting
  def hi
    greet("Hello")
  end

  def self.hi
    puts 'Hello from the class!'
  end
end

Hello.hi # => Hello from the class!