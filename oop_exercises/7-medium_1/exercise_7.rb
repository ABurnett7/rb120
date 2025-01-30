=begin
In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. 
You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:

Math.log2(size_of_range).to_i + 1
=end

# Needs refactoring, but it works
class GuessingGame
  attr_accessor :guesses, :number, :guess, :range

  def initialize(number1, number2)
    @range = (number1..number2)
    @guesses = Math.log2(range.size).to_i + 1
    @number = rand(range)
    @guess = nil
  end

  def match?(answer)
    return true if answer == number
  end

  def no_match(answer)
    puts(answer > number ? "Your guess is too high.": "Your guess is too low")
  end

  def valid_guess?(answer)
    range.include?(answer)
  end 

  def play
    loop do
      loop do 
        puts ' '
        puts "You have #{guesses} guesses remaining."
        puts "Enter a number between #{range.first} and #{range.last}:"
        self.guess = gets.chomp
        break if valid_guess?(guess.to_i)
        puts "Invalid guess. Enter a number between #{range.first} and #{range.last}: "
      end
      if match?(@guess.to_i)
        puts "You won!"
        return
      end
      no_match(@guess.to_i)
      self.guesses -= 1
      break if guesses == 0
    end
    puts 'You have no more guesses. You lost!'
  end
end

game = GuessingGame.new(501, 1500)
game.play