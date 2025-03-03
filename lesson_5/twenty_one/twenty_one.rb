# I didn't comment much at all
# Still needs to be refactored and a YAML. Lot's of repetive things in here...


class Card
  attr_reader :rank, :suit
  VALUES = { 'Jack' => 10, 'Queen' => 10, 'King' => 10, 'Ace' => 11 }
  
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
  
  def value
    VALUES.fetch(rank, rank)
  end
end

class Deck
  attr_accessor :deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    @deck = RANKS.product(SUITS).map { |rank, suit| Card.new(rank, suit) }
  end
end


class Shoe
  attr_reader :shoe, :size

  def initialize(number_of_decks)
    @shoe = new_shoe(number_of_decks)
    @size = 52 * number_of_decks
  end

  def forty_percent
    shoe.size < (size * 0.4)
  end

  def deal
    shoe.pop
  end

  private
  def new_shoe(number_of_decks)
    (Deck.new.deck * number_of_decks).shuffle!
  end
end

class TwentyOneHand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def <<(card)
    cards << card
  end

  def total
    hand_total = cards.map { |card| card.value }.sum
    adjust_aces(hand_total)
  end

  def display
    cards.map(&:to_s).join(', ')
  end

  def display_with_total
    "#{display} (Total: #{total})"
  end

  def first_card_total
    cards.first.value
  end

  def first_card
    cards.first.to_s
  end

  def bust?
    total > 21
  end

  private

  def aces
    cards.map { |card| card.rank }.count('Ace')
  end

  def adjust_aces(hand_total)
    aces.times do
      break if hand_total < 22
      hand_total -= 10
    end
    hand_total
  end
end

class Participant
  include Comparable
  attr_accessor :hand, :shoe, :game

  def initialize(shoe, game)
    @hand = TwentyOneHand.new
    @shoe = shoe
    @game = game
  end

  def hit
    @hand << shoe.deal
  end

  def stay
  end

  def <=>(other)
    hand.total <=> other.hand.total
  end
end

class Dealer < Participant
  def hit_until_17
    game.clear
    game.game_display
    until hand.total > 16
      #Player wins if dealer busts
      game.clear
      game.game_display
      puts "Dealer Hits"
      sleep 1
      hit
      game.clear
      game.game_display
      sleep 1
    end
  end

end

class HumanPlayer < Participant
  attr_accessor :chips

  def initialize(shoe, game)
    super(shoe, game)
    @chips = 100
  end

  def turn
    if hand.total == 21
      game.blackjack
      return
    end

    loop do
      game.clear
      game.game_display
      puts "\nWhat would you like to do? (H)it or (S)tay?"
      move = gets.chomp.upcase

      case move
      when 'H'
        hit
        if hand.bust?
          game.dealers_turn = true
          break
        end
      when 'S'
        game.dealers_turn = true
        break
      else
        puts "Invalid option. Please enter H or S."
      end
    end
  end
end

class TwentyOneGame
  attr_accessor :player, :dealer, :shoe, :number_of_decks, :dealers_turn, :participants, :bet

  def initialize
    clear
    puts "How many decks would you like to play with?"
    @number_of_decks = gets.chomp.to_i # need verification
    @shoe = Shoe.new(@number_of_decks)
    @player = HumanPlayer.new(@shoe, self)
    @dealer = Dealer.new(@shoe, self)
    @dealers_turn = false
    @participants = [@player, @dealer]
    @bet = 0
    play
  end

  def play
    clear
    welcome_message
    game_loop
  end

  def game_loop
    loop do
      loop do
        # Check if the shoe needs to be reset before starting a new hand
        if shoe.forty_percent
          clear
          puts "Less than 40% of the cards remain in the shoe. Resetting the shoe..."
          @shoe = Shoe.new(number_of_decks)
          player.shoe = @shoe
          dealer.shoe = @shoe
          sleep(1)
        end
        break
      end
      loop do
        puts "What's your bet? (You have #{player.chips} chips remaining)."
        self.bet = gets.chomp.to_i
        if bet <= 0 || bet > player.chips
          puts "Invalid bet! You must bet between 1 and #{player.chips} chips."
        else
          break
        end
      end
      player.chips -= bet
      reset_round
      deal_hands

      player.turn

      unless player.hand.bust?
        dealer.hit_until_17
      end

      display_result
      if player.chips <= 0
        goodbye_message_out_of_chips
        break
      end
      break unless play_again?
    end  
    goodbye_message
  end

  def reset_round
    @player.hand = TwentyOneHand.new
    @dealer.hand = TwentyOneHand.new
  end

  def display_result
    if player.hand.bust?
      puts "You busted!"
      puts "You now have #{player.chips} chips."
    elsif dealer.hand.bust? || player.hand.total > dealer.hand.total
      self.player.chips += bet * 2
      puts "You win!"
      puts "You now have #{player.chips} chips."
    elsif player.hand.total == dealer.hand.total
      self.player.chips += bet
      puts "It's a tie!"
      puts "You now have #{player.chips} chips."
    else
      puts "Dealer wins!"
      puts "You now have #{player.chips} chips."
    end
  end

  def play_again?
    self.dealers_turn = false
    puts "Play again? (Y)es or (N)o"
    answer = gets.chomp.upcase
    answer == 'Y'
  end

  def welcome_message
    2.times do
      ["", ".", "..", "..."].each do |message|
        puts "\rShuffling#{message}"
        sleep 0.25
        clear
      end
    end
    puts 'Good luck!'
    sleep 0.75
  end

  def goodbye_message
    clear
    puts "Thanks for playing!"
    puts "You ended with #{player.chips} chips."
    exit
  end

  def goodbye_message_out_of_chips
    puts "You've run out of chips! Game over."
    puts "Thanks for playing!"
    puts "You ended with #{player.chips} chips."
    exit
  end

  def game_display
    if dealers_turn
      puts "You have #{player.chips} chips left.\nCurrent bet: #{bet}.\n\n"
      puts "Your Total: #{player.hand.total}\nDealer Total: #{dealer.hand.total}\n\n"
      puts "Dealer's hand: #{dealer.hand.display_with_total}"
      puts "Your hand: #{player.hand.display_with_total}"
    else
      puts "You have #{player.chips} chips left.\nCurrent bet: #{bet}.\n\n"
      puts "Your Total: #{player.hand.total}\nDealer Total Showing: #{dealer.hand.first_card_total}\n\n"
      puts "Dealer is showing: #{dealer.hand.first_card}"
      puts "Your hand: #{player.hand.display_with_total}"
    end
  end

  def deal_hands
    2.times do 
      @participants.each do |participant|
        participant.hit
      end
    end
  end

  def blackjack
    game_display
    puts "Blackjack! You win immediately!"
    # Payout: original bet + 1.5 times the bet.
    self.player.chips += bet * 2.5
    sleep(2)
  end

  def clear
    system 'clear'
  end
end

TwentyOneGame.new