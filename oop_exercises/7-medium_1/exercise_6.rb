=begin
Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. 
The game should play like this:
=end

# Needs refactoring, but it works

class GuessingGame
  RANGE = (1..100)
  attr_accessor :guesses, :number, :guess

  def initialize
    @guesses = 7
    @number = rand(RANGE)
    @guess = nil
  end

  def match?(answer)
    return true if answer == number
  end

  def no_match(answer)
    puts(answer > number ? "Your guess is too high.": "Your guess is too low")
  end

  def valid_guess?(answer)
    RANGE.include?(answer)
  end 

  def play
    loop do
      loop do 
        puts ' '
        puts "You have #{guesses} guesses remaining."
        puts "Enter a number between #{RANGE.first} and #{RANGE.last}:"
        self.guess = gets.chomp
        break if valid_guess?(guess.to_i)
        puts "Invalid guess. Enter a number between #{RANGE.first} and #{RANGE.last}: "
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

game = GuessingGame.new
game.play