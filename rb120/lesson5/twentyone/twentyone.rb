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

fix bug:

- after splash screen
  - press 'h' to read the game rules
  - press 's' to start a new game

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
require 'yaml'

MESSAGES = YAML.load_file('twentyone_messages.yml')

module Displayable
UNICODE_SUITS = [[9828].pack('U*'), [9825].pack('U*'),
                 [9831].pack('U*'), [9826].pack('U*')]

  def clear
    system 'clear'
  end

  def new_line(num = 1)
    num.times { puts }
  end

  def horizontal_line
    puts ('-' * 80)
  end

  def prompt(msg)
    puts "=> #{msg}"
  end

  def prompt_yaml(msg)
    puts "=> #{MESSAGES[msg]}"
  end

  def puts_yaml_center(msg)
    puts "#{MESSAGES[msg].center(80)}"
  end

  def display_loading(count, output, msgs)
    print "=> #{msgs[0]} "

    count.times do
      print '.'
      sleep 0.1
    end

    puts " #{msgs[1]}!"
    sleep 1
  end

  def pause(time)
    sleep(time)
  end

  # def drumroll(total_wins) # implement
  #   prompt 'Drumroll please!'
  #   pause(20, ['And the winner is ', "the #{total_wins.key(5)}"], true)
  #   puts ""
  # end
end

class Deck
  SUITS = [:Spade, :Heart, :Club, :Diamond]
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]

  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  def shuffle!
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
  include Displayable
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
      prompt_yaml 'set_name'
      self.name = gets.chomp.capitalize
      break unless name.empty?
      prompt_yaml 'try_again1'
    end
  end

  def takes_turn(deck) # refactor to chooses_turn, extracts stay/hits logic
    loop do
      choice = nil

      loop do
        prompt_yaml 'hit_or_stay'
        choice = gets.chomp.upcase
        break if ['H', 'S'].include? choice[0]
        prompt_yaml 'try_again2'
      end

      self.stays if choice.start_with? 'S'
      self.hits(deck) if choice.start_with? 'H'
      # display_cards # this isn't going to fly
      break if self.stays? || self.busts?
    end
    puts "#{self.name} stays." if self.stays?
  end

  def hits(deck)
    card = deck.cards.pop # mutates the deck
    hand << card
    puts "#{self.name} draws a #{card.rank} of #{card.suit}."
  end

  def stays
    @stay = true
  end

  def stays?
    @stay
  end

  def busts?
    self.score > 21
  end

  def displays_hand
    if hand.size > 2
      "#{hand[0...-1].join(', ')}, and #{hand.last}"
    else
      hand.join(' and ')
    end
  end

  def score # total points in hand
    num_of_aces = hand.count { |card| card.rank == :Ace }
    cards_scored = score_cards
    reevaluate_for_aces(cards_scored, num_of_aces).sum
  end

  private

  def score_cards # ace starts with min value
    hand.map do |card|
      if (2..10).include? card.rank
        card.rank
      elsif [:Jack, :Queen, :King].include? card.rank
        10
      else # ace
        1
      end
    end
  end

  def reevaluate_for_aces(cards_scored, num_of_aces)
    num_of_aces.times do
      cards_scored << 10 if cards_scored.sum <= 11
    end
    cards_scored
  end
end

class Dealer < Player
  AI_NAMES = ['Bender', 'Faye', 'Roy Batty', 'Data', 'Bishop', 'Dot Matrix']

  def set_name
    self.name = AI_NAMES.sample
  end

  def takes_turn(deck)
    loop do
      self.score < 17 ? self.hits(deck) : self.stays
      # display_cards
      gets
      break if self.stays? || self.busts?
    end
  end
end

class TwentyOneGame
  include Displayable
  attr_accessor :deck, :user, :dealer

  def initialize
    @deck = Deck.new
    @user = Player.new
    @dealer = Dealer.new
  end

  def play
    display_greetings_message
    display_menu
    setup_game
    display_introductions(user, dealer)
    play_game
    display_goodbye_message
  end

  private

  def display_greetings_message
    display_splash_screen
    new_line
    puts_yaml_center 'continue'
    gets
  end

  def display_splash_screen
    clear
    new_line 5
    puts_yaml_center 'greetings'
    puts UNICODE_SUITS.join('  ').center(80)
  end

  def display_menu
    choice = nil
    loop do
      loop do
        display_splash_screen
        new_line
        prompt_yaml 'new_game?'
        prompt_yaml 'display_rules?'
        choice = gets.chomp.upcase
        break if ['N', 'R'].include? choice[0]
      end

      break if choice.start_with? 'N'
      display_game_rules if choice.start_with? 'R'
    end
  end

  def setup_game
    clear
    new_line
    user.set_name
    dealer.set_name
  end

  def display_introductions(user, dealer)
    clear
    new_line
    prompt "Welcome to the blackjack table, #{user.name}."
    pause 1
    prompt "Please welcome, #{dealer.name}, your dealer for this game."
    pause 1
  end

  def display_game_rules
    clear
    new_line
    prompt_yaml 'game_rules'
    new_line
    puts_yaml_center 'continue'
    gets
  end

  def play_game
    shuffle_cards
    deal_cards
    new_line
    display_cards
    players_take_turns(deck)
    display_winner
  end

  def shuffle_cards
    deck.shuffle!
    display_shuffling
  end

  def display_shuffling
    new_line
    display_loading(15, true, ['Shuffling ', 'FINISHED'])
  end

  def deal_cards # 2 cards to each player
    2.times do
      user.hand << deck.cards.pop # both face up
      dealer.hand << deck.cards.pop # one face up, one face down
    end
  end

  def display_cards
    puts "#{user.name} has #{user.displays_hand}. (#{user.score} points)"
    puts "#{dealer.name} has #{dealer.displays_hand}. (#{dealer.score} points)"
  end

  def players_take_turns(deck)
    [user, dealer].each do |player|
      new_line
      player.takes_turn(deck)
      new_line
      display_cards
      break if player.busts?
    end
  end

  def display_winner
    puts "#{winner} wins the game!"
  end

  def winner
    if user.busts?
      dealer
    elsif dealer.busts?
      user
    else
      dealer.score >= user.score ? dealer : user
    end
  end

  def display_goodbye_message
    puts_yaml_center 'goodbye'
  end
end

TwentyOneGame.new.play
