=begin
Write a description of the problem and extract major nouns and verbs.
Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.
Optional - when you have a better idea of the problem, model your thoughts into CRC cards.

Problem:
The game of twenty-one is played between two people, a dealer and a player.  The game is played by both people trying to end up with the highest hand at or under 21.  If a person goes over, that person busts and loses.
To play, the dealer starts with a deck of 52 cards.  The cards are made of 4 suits, or types of cards (spade, heart, club, and diamond).  Each suit contains 13 cards (2, 3, .. 10, jack, queen, king, ace).  The dealer deals each person 2 cards: the first face down, and second face up.
The first turn belongs to the player.  The player can choose to hit or stay.  If the player chooses to hit, the dealer deals another face up card to the player.  The player continues her/his turn until s/he chooses stay (which ends her/his turn) or her/his hand is over 21 (which is a bust, meaning the player loses).  If the player's turn ends, it is the dealer's turn.
The dealer plays by following a strict rule.  If the dealer's hand is under 17, always hit.  If the hand is above 16, always stay.
If neither the dealer nor player have busted, the person with the highest hand wins.  The tie goes to the dealer.

If the card is a number, its value is determined by the number.  If the card is a face, its value is 10.  If the card is an ace, it is either 1 or 11 (11 unless it forces the hand to bust).

--------------------
Extracting keywords:

Nouns:
Game
Person
- Player
  - Hand
    - Card
- Dealer
  - Hand
    - Card
Deck
- Card

Verbs:
play
- deals
- hits
- stays

- score
- wins
- busts

-----------------
todo:

improve UI
- add new lines
- clear screen
- display cards during initial dealing of hand
  - hide one of dealer's cards
- add unicode graphics to greetings (there should be unicode for suits)

improve logic:
- add instructions option
- add option to play again
- add option to split when dealt two of a kind
- add option to gamble
  - create user wallet
  - add wager during user turn

=end

class Deck
  SUITS = [:Spade, :Heart, :Club, :Diamond]
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]

  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  def shuffle # mutates
    @cards.shuffle!
  end

  private

  def build_deck
    SUITS.map { |suit| RANKS.map { |rank| Card.new(suit, rank) }}.flatten
  end
end

class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Player
  attr_writer :stay
  attr_accessor :hand, :name

  def initialize
    @hand = []
    @stay = false # false means turn is not over, true means turn is over
  end

  def to_s
    self.name
  end

  def set_name
    loop do
      puts "What should we call you?"
      self.name = gets.chomp.capitalize
      break unless name.empty?
      puts "Sorry, I'm going to need something with a little substance.  Let's try again."
    end
  end

  def takes_turn(deck) # refactor to chooses_turn, extracts stay/hits logic
    loop do
      choice = nil

      loop do
        puts "Do you want to (h)it or (s)tay?"
        choice = gets.chomp.upcase
        break if ['H', 'S'].include? choice[0]
        puts "Sorry, I didn't get that.  Let's try again."
      end

      self.stay = true if choice.start_with? 'S'
      self.hits(deck) if choice.start_with? 'H'
      break if self.stays? || self.busts?
    end
    puts "#{self.name} stays." if self.stays?
  end

  def hits(deck)
    card = deck.cards.pop # mutates the deck
    hand << card
    puts "#{self.name} draws a #{card.rank} of #{card.suit}."
  end

  def stays?
    @stay
  end

  def busts?
    self.score > 21
  end

  def display_hand
    if hand.size > 2
      "#{hand[0...-1].join(', ')}, and #{hand.last}"
    else
      hand.join(' and ')
    end
  end

  def score # points in player's hand
    num_of_aces = hand.count { |card| card.rank == :ace }

    cards_scored = hand.map do |card|
                     if (2..10).include? card.rank
                       card.rank
                     elsif [:Jack, :Queen, :King].include? card.rank
                       10
                     else
                       1 # ace starts with min value
                     end
                   end

    num_of_aces.times do # converts ace values to 11 if the hand doesn't bust
      cards_scored << 10 if cards_scored.sum <= 11
    end

    cards_scored.sum
  end
end

class Dealer < Player
  AI_NAMES = ['Bender', 'Faye', 'Roy Batty', 'Data', 'Bishop', 'Dot Matrix']

  def set_name
    self.name = AI_NAMES.sample
  end

  def takes_turn(deck)
    loop do
      self.score > 16 ? self.hits(deck) : (self.stay = true)
      break if self.stays? || self.busts?
    end
  end
end

class TwentyOneGame
  attr_accessor :deck, :user, :dealer

  def initialize
    @deck = Deck.new
    @user = Player.new
    @dealer = Dealer.new
  end

  def play
    display_greetings_message
    setup_game
    play_game
    display_goodbye_message
  end

  private

  def display_greetings_message
    puts "Welcome to Blackjack!"
  end

  def setup_game
    user.set_name
    dealer.set_name
  end

  def play_game
    deck.shuffle
    deal_cards
    players_take_turns(deck)
    display_cards
    display_winner
  end

  def deal_cards # 2 cards to each player
    2.times do
      user.hand << deck.cards.pop # both face up
      dealer.hand << deck.cards.pop # one face up, one face down
    end
  end

  def players_take_turns(deck)
    [user, dealer].each do |player|
      player.takes_turn(deck)
      break if player.busts?
    end
  end

  def display_cards
    puts "#{user.name} has #{user.display_hand}. (#{user.score} points)"
    puts "#{dealer.name} has #{dealer.display_hand}. (#{dealer.score} points)"
  end

  def display_winner
    puts "#{winner} wins the game!"
  end

  def winner
    if user.score > 21
      dealer
    elsif dealer.score > 21
      user
    else
      dealer.score >= user.score ? dealer : user
    end
  end

  def display_goodbye_message
    puts "Thanks for playing!  Goodbye."
  end
end

TwentyOneGame.new.play
