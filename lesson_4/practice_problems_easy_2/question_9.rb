=begin

If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

What would happen if we added a play method to the Bingo class,
keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.
=end

# My Answer

# If we add a play method to the Bingo class, then it will override the play method Bingo inherited from the Game class when it is invoked on Bingo.

