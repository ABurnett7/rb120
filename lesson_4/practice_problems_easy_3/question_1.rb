=begin
If we have this code:

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

What happens in each of the following cases:

=end

# My Answer:

hello = Hello.new
hello.hi # => Hello

hello = Hello.new
hello.bye # => error, undefined method bye for instance of Hello class

hello = Hello.new
hello.greet # => error, not enough arguments, expecting 1, 0 given.

Hello.hi # => error, no Hello class method #hi.



