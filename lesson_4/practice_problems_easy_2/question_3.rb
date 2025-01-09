=begin
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

What is the lookup chain for Orange and HotSauce?

=end

# My Answer:

# The method lookup chaing is [Orange/HotSauce, Taste, Object, Kernel, BasicObject]


module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

p Orange.ancestors # => [Orange, Taste, Object, Kernel, BasicObject]
p HotSauce.ancestors # => [HotSauce, Taste, Object, Kernel, BasicObject]