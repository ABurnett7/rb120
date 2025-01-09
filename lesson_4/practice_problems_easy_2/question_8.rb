=begin
If we have this class:

class Game
  def play
    "Start the game!"
  end
end

And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end

What can we add to the Bingo class to allow it to inherit the play method from the Game class?

=end

# My Answer:

# add < Game to the line class Bingo, so the Bingo class will inherit the play method.
# class Bingo < Game