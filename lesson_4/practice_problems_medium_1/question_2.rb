=begin
Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

Can you spot the mistake and how to address it?

=end
# My answer:

# in the method update_quantity, a local variable quantity is created rather than accessing the instance variable @quantity.
# There are a few ways around this.

# First, use the instnace method directly
# Second, create a setter method for @quantity and use self.setter_method.

