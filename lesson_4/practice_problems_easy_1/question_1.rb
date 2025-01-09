=begin
Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142
=end

# My Answer

# "hello", [1, 2, 3, "happy days"] and 142 are objects.  

# To find the class use the Kernel#class method

p "hello".class # => String
p [1, 2, 3, "happy days"].class # => Array
p 142.class # => Integer

p true.class # => error 
             # WRONG! output is actually TrueClass, meaning true is an object too. )
