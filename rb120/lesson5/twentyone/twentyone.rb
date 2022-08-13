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

improve UI
- clear screen
- hide one of dealer's cards

improve logic:
- add option to play again
- add option to split when dealt two of a kind
- add option to gamble
  - create user wallet
  - add wager during user turn

=end
require 'pry'
require 'pry-byebug'
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

  def horizontal_line # currently unused
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

  def display_try_again(choice_empty)
    if choice_empty
      prompt_yaml 'try_again1'
    else
      prompt_yaml 'try_again2'
    end
  end

  # def drumroll(total_wins) # implement
  #   prompt 'Drumroll please!'
  #   pause(20, ['And the winner is ', "the #{total_wins.key(5)}"], true)
  #   puts ""
  # end
end

module Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def displays_hand(show_first_card = true) # can hide a card # test
    hand = hand_with_articles
    hand = hides_first_card unless show_first_card

    if hand.size > 2
      "#{hand[0...-1].join(', ')}, and #{hand.last}"
    else
      hand.join(' and ')
    end
  end

  def score # total points in hand
    num_of_aces = hand.count { |card| card.rank == :Ace }
    cards_scored = cards_initial_score
    cards_reevaluated_for_aces(cards_scored, num_of_aces).sum
  end

  private

  def hand_with_articles
    hand.map { |card| "#{card.with_article}" }
  end

  def hides_first_card
    first_card = 'an unknown card'
    hand[1..].prepend first_card
  end

  def cards_initial_score # ace starts with min value
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

  def cards_reevaluated_for_aces(cards_scored, num_of_aces)
    num_of_aces.times do
      cards_scored << 10 if cards_scored.sum <= 11
    end
    cards_scored
  end
end

class Player
  include Displayable
  include Hand
  attr_accessor :name

  def initialize
    super # from Hand
    @stay = false # false means turn is not over, true means turn is over
  end

  def to_s
    self.name
  end

  def set_name
    try_again = nil
    prompt_yaml 'set_name1'

    loop do
      if try_again
        prompt_yaml 'try_again1'
        pause 1
        prompt_yaml 'set_name2'
      end
      self.name = gets.chomp.capitalize
      break unless name.empty?
      try_again = true
      pause 0.5
      clear
      new_line
    end
  end

  def chooses_move(deck)
    choice = nil

    loop do
      prompt_yaml 'hit_or_stay'
      choice = gets.chomp.upcase
      break if ['H', 'S'].include? choice[0]
      display_try_again(choice.empty?)
    end

    self.stays if choice.start_with? 'S'
    self.hits(deck) if choice.start_with? 'H'
  end

  def hits(deck) # mutates the deck
    card = deck.cards.pop
    hand << card
    prompt "#{self.name} draws #{card.with_article}."
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
end

class Dealer < Player
  AI_NAMES = ['Bender', 'Faye', 'Roy Batty', 'Data', 'Bishop', 'Dot Matrix']
  attr_writer :reveals_hidden_card

  def set_name
    self.name = AI_NAMES.sample
  end

  def chooses_move(deck)
    self.score < 17 ? self.hits(deck) : self.stays
    self.reveals_hidden_card = true
  end

  def reveals_hidden_card?
    @reveals_hidden_card
  end
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

  def with_article # applies an article with correct grammar
    [:Ace, 8].include?(rank) ? "an #{self}" : "a #{self}"
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
    loop do
      display_menu
      setup_game
      display_introductions(user, dealer)
      play_game
      break unless play_again?
    end
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
    choices = ['N', 'R'] # (N)ew game or (R))ules
    choice = nil
    loop do
      loop do
        display_splash_screen
        new_line 2
        puts_yaml_center 'new_game?'
        puts_yaml_center 'display_rules?'
        choice = gets.chomp.upcase
        break if choices.include? choice[0]
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
    prompt "My name is #{dealer.name} and I will be your dealer for this game."
    pause 0.5
    puts "   (btw, does it annoy you when people speak in third person?)"
    pause 1.5
  end

  def display_game_rules
    clear
    new_line 7
    puts_yaml_center 'game_rules1'
    puts_yaml_center 'game_rules2'
    new_line
    puts_yaml_center 'continue'
    gets
  end

  def play_game
    new_line
    shuffle_cards
    deal_cards
    new_line
    display_cards
    new_line
    players_take_turns(deck)
    new_line
    display_winner
  end

  def shuffle_cards
    deck.shuffle!
    display_shuffling
  end

  def display_shuffling
    display_loading(15, true, ['Shuffling ', 'FINISHED'])
  end

  def deal_cards # 2 cards to each player
    2.times do
      user.hand << deck.cards.pop
      dealer.hand << deck.cards.pop
    end
  end

  def display_cards # test
    dealers_hand = if dealer.reveals_hidden_card?
                     dealer.displays_hand
                   else
                     dealer.displays_hand(false)
                   end

    prompt "#{user.name} has #{user.displays_hand}. (#{user.score} points)"
    prompt "#{dealer.name} has #{dealers_hand}. (#{dealer.score} points)"
  end

  def players_take_turns(deck)
    [user, dealer].each do |player|
      current_turn(player, deck)
      break if player.busts?
    end
  end

  def current_turn(player, deck)
    loop do
      new_line
      player.chooses_move(deck)
      break if player.stays?
      new_line
      display_cards
      break if player.busts?
      pause 1.5
    end
    puts "#{player.name} stays." if player.stays?
  end

  def display_winner
    # clear
    # new_line
    # display_cards
    # new_line
    prompt "#{winner} wins the game!"
  end

  def winner
    if user.busts?
      dealer
    elsif dealer.busts?
      user
    # elsif dealer.score == user.score
      # tie
    else
      dealer.score >= user.score ? dealer : user
    end
  end

  def play_again?
    choices = ['Y', 'N'] # (Y)es or (N)o
    choice = nil

    loop do
      prompt_yaml 'play_again?'
      choice = gets.chomp.upcase
      break if choices.include? choice[0]
      display_try_again(choice.empty?)
    end

    choice[0] == 'Y'
  end

  def display_goodbye_message
    puts_yaml_center 'goodbye'
  end
end

TwentyOneGame.new.play
