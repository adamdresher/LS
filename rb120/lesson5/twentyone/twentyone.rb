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

  def confirm(msg, alignment = :left) # test
    new_line
    alignment == :left ? prompt_yaml(msg) : puts_yaml_center(msg)
    gets
  end

  def display_try_again(choice_empty)
    choices = (1..7).map { |num| "try_again#{num}" }
    choice = choice_empty ? choices[0] : choices[1..].sample

    prompt_yaml choice
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

  def return_cards
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
      new_line
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

  def return_cards
    super
    @stay = false
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

  def secret_hand
    if self.reveals_hidden_card?
      self.displays_hand
    else
      self.displays_hand(false)
    end
  end

  def secret_score
    if self.reveals_hidden_card?
      self.score
    else
      '???'
    end
  end

  def return_cards
    super
    reveals_hidden_card = false
  end

  private

  def reveals_hidden_card?
    @reveals_hidden_card
  end
end

class Deck
  SUITS = [:Spade, :Heart, :Club, :Diamond]
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]

  attr_reader :cards

  def initialize
    reset
  end

  def reset
    @cards = SUITS.map { |suit| RANKS.map { |rank| Card.new(suit, rank) }}.flatten
  end

  def shuffle!
    @cards.shuffle!
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

  def with_article # applies with correct grammar
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
    game_menu
    greet_dealer
    loop do
      setup_game
      play_game
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def display_greetings_message
    display_splash_screen
    confirm('continue', :centered)
  end

  def display_splash_screen
    clear
    new_line 5
    puts_yaml_center 'greetings'
    puts UNICODE_SUITS.join('  ').center(80)
  end

  def game_menu
    choices = ['N', 'R'] # (N)ew game or (R))ules
    choice = nil

    loop do
      loop do
        display_menu
        choice = gets.chomp.upcase
        break if choices.include? choice[0]
      end

      break if choice.start_with? 'N'
      display_game_rules if choice.start_with? 'R'
    end
  end

  def display_menu
    display_splash_screen
    new_line 2
    puts_yaml_center 'new_game?'
    puts_yaml_center 'display_rules?'
  end

  def greet_dealer
    clear
    new_line
    user.set_name
    dealer.set_name
    display_introductions(user, dealer)
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
    confirm('continue', :centered)
  end

  def setup_game
    new_line
    collect_cards
    shuffle_cards
    confirm('begin')
  end

  def collect_cards
    user.return_cards
    dealer.return_cards
    deck.reset
  end

  def play_game
    clear
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

  def display_cards
    prompt "#{user.name} has #{user.displays_hand}. (#{user.score} points)"
    prompt "#{dealer.name} has #{dealer.secret_hand}. (#{dealer.secret_score} points)"
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
    if winner
      prompt "#{winner} wins the game!"
    else
      prompt "Tie goes to the #{dealer}, suck it."
    end
  end

  def winner
    if user.busts?
      dealer
    elsif dealer.busts?
      user
    elsif dealer.score == user.score
      nil
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
      new_line
      display_try_again(choice.empty?)
    end

    choice[0] == 'Y'
  end

  def display_goodbye_message
    prompt_yaml 'goodbye'
  end
end

TwentyOneGame.new.play
