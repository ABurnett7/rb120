=begin
You may remember our Minilang language from back in the RB101-RB109 Medium exercises. 
We return to that language now, but this time we'll be using OOP. If you need a refresher, refer back to that exercise.

Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

You should initialize the register to 0.
=end

class Minilang
  def initialize(instructions)
    @register = 0 
    @stack = []
    @commands = []
    convert_instructions(instructions)
  end

  def eval
    commands.each do |command|  
      case 
      when command.is_a?(Integer)   then command_integer(command)
      when command == 'PUSH'        then command_push 
      when command == 'ADD'         then command_add
      when command == 'SUB'         then command_sub 
      when command == 'MULT'        then command_mult 
      when command == 'DIV'         then command_div 
      when command == 'MOD'         then command_mod 
      when command == 'POP'         then command_pop
      when command == 'PRINT'       then command_print
      else 
        puts "Invalid token: #{command}"
        break
      end
    end
  end

  private
  attr_accessor :register, :stack, :commands 

  def convert_instructions(instructions)
    instructions.split(' ').each do |instruction| 
      @commands << (is_integer?(instruction) ? instruction.to_i : instruction)
    end
  end

  def pop
    @stack.pop
  end

  def is_integer?(string)
    string.to_i.to_s == string
  end

  def command_push
    @stack << register
  end

  def command_integer(integer)
    self.register = integer 
  end

  def command_add
    self.register += pop 
  end

  def command_sub
    self.register -= pop
  end

  def command_mult
    self.register = register * pop
  end

  def command_div
    self.register = register / pop
  end 
  
  def command_mod 
    self.register = register % pop
  end 
  
  def command_pop
    self.register = pop
  end

  def command_print
    puts register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
