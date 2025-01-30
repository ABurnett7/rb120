

# My solution:  Over thought it, but it works.

class CircularBuffer
  
  def initialize(number)
    @circular_buffer = (1..number).to_h { |key| [key, nil] }
    @add_next = (1..number).to_a
    @remove_next = (1..number).to_a
  end

  def put(element)
    if circular_buffer.values.all?
      circular_buffer[add_next[0]] = element
      remove_next << remove_next.shift
      add_next << add_next.shift
    else
      circular_buffer[add_next[0]] = element
      add_next << add_next.shift
    end
  end

  def get
    return nil if circular_buffer.values.none?
    remove_next << remove_next.shift
    value = circular_buffer[remove_next[-1]] 
    circular_buffer[remove_next[-1]] = nil
    value
  end
  
  private
  attr_accessor :circular_buffer, :add_next,  :remove_next
end


buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2


buffer.put(5)
buffer.put(6)
buffer.put(7)

puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil