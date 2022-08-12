=begin
Twenty one is a card game consisting of a dealer and a player, where the
participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52 card deck.
- The player takes the first turn, and can 'hit' or 'stay'.
- If the player busts, he loses.  If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins.  If both player and dealer stay, then the
  highest total wins.
- If both totals are equal, then it's a tie and nobody wins.

Extrapolating keywords:

Nouns: card, player, dealer, participant, deck, game, total
Verbs: deal, hit, stay, busts

Player
- hit
- stay
- busted?
- total
Dealer
- hit
- stay
- busted?
- total
- deal (should this be here or Deck?)
Participant
Deck
- deal (should this be here or Dealer?)
Card
Game
- start
=end

class Participant
  attr_accessor :hand, :name

  def initialize
    @hand = []
    @stay = false
  end

  def to_s
    self.name
  end

  def hit(deck)
    card = deck.cards.pop
    hand << card
    puts "#{name} draws a #{card.rank} of #{card.suit}."
  end

  def stay
    @stay = true
  end

  def stays?
    @stay
  end

  def busted?
    total > 21
  end

  def total
    num_of_aces = hand.count { |card| card.rank == :Ace }

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

  def shows_hand
    if hand.size > 2
      "#{hand[0...-1].join(', ')}, and #{hand.last}"
    else
      hand.join(' and ')
    end
  end
end

class Player < Participant
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

      self.stay if choice.start_with? 'S'
      self.hit(deck) if choice.start_with? 'H'
      # display_cards # this isn't going to fly
      break if self.stays? || self.busted?
    end
    puts "#{self.name} stays." if self.stays?
  end
end

class Dealer < Participant
  AI_NAMES = ['Bender', 'Faye', 'Roy Batty', 'Data', 'Bishop', 'Dot Matrix']

  def set_name
    self.name = AI_NAMES.sample
  end

  def takes_turn(deck)
    loop do
      self.total < 17 ? self.hit(deck) : self.stay
      break if self.stays? || self.busted?
    end
  end
end

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

class Game
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    set_participant_names
    deal_cards
    show_cards
    player.takes_turn(deck)
    show_cards
    if player.busted?
      show_player_busted
    else
      dealer.takes_turn(deck) 
      show_cards
      show_dealer_busted if dealer.busted?
    end
    show_winner
  end

  private
  def set_participant_names
    player.set_name
    dealer.set_name
  end

  def deal_cards # 2 cards to each player
    deck.shuffle

    2.times do
      player.hand << deck.cards.pop # both face up
      dealer.hand << deck.cards.pop # one face up, one face down
    end
  end

  def show_cards
    puts "#{player.name} has #{player.shows_hand}. (#{player.total} points)"
    puts "#{dealer.name} has #{dealer.shows_hand}. (#{dealer.total} points)"
  end

  def show_player_wins
    puts "#{dealer.name} busts!"
  end

  def show_dealer_wins
    puts "#{player.name} busts!"
  end

  def show_winner
    puts "#{winner} wins the game!"
  end

  def winner
    if player.busted?
      dealer
    elsif dealer.busted?
      player
    else
      dealer.total >= player.total ? dealer : player
    end
  end
end

Game.new.start
