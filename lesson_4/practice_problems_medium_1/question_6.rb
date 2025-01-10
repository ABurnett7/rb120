=begin
If we have these two methods in the Computer class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

and

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

What is the difference in the way the code works?
=end

# My Answer:

# There's not really a difference, in show_template, one code uses self. to explicitly call the getter, but it's unnecessary. 