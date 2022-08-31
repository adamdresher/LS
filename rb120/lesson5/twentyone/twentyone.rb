require 'yaml'

MESSAGES = YAML.load_file('twentyone_messages.yml')

module Formatable
  def clear
    system 'clear'
  end

  def new_line(num = 1)
    num.times { puts }
  end

  def clear_and_new_line(quantity = 1)
    clear
    new_line quantity
  end

  def prompt(msg)
    puts "=> #{msg}"
  end

  def prompt_yaml(msg)
    puts "=> #{MESSAGES[msg]}"
  end

  def puts_yaml(msg)
    puts "#{MESSAGES[msg]}"
  end

  def puts_yaml_center(msg)
    puts MESSAGES[msg].center(80)
  end

  def prompt_yaml_with_var(msg, vars)
    puts "=> #{format(MESSAGES[msg], *vars)}"
  end

  def pause(time)
    sleep time
  end

  def enter_any_key(msg, alignment = :left)
    new_line
    alignment == :left ? prompt_yaml(msg) : puts_yaml_center(msg)
    gets
  end

  def display_try_again(choice_empty)
    choices = (1..7).map { |num| "try_again#{num}" }
    choice = choice_empty ? choices[0] : choices[1..-1].sample

    prompt_yaml choice
  end
end

module Displayable
  UNICODE_SUITS = [[9828].pack('U*'), [9825].pack('U*'),
                   [9831].pack('U*'), [9826].pack('U*')]

  def display_greetings_message
    display_splash_screen
    enter_any_key('continue', :centered)
  end

  def display_splash_screen
    clear_and_new_line 5
    puts_yaml_center 'greetings'
    new_line
    puts UNICODE_SUITS.join('  ').center(80)
  end

  def display_menu
    display_splash_screen
    new_line 2
    puts_yaml_center 'new_game?'
    puts_yaml_center 'display_rules?'
  end

  def display_introductions(user, dealer)
    clear_and_new_line
    prompt_yaml_with_var('intro1', [name: user.name])
    pause 1
    prompt_yaml_with_var('intro2', [name: dealer.name])
    pause 0.5
    puts_yaml('intro3')
    pause 1.5
  end

  def display_game_rules
    clear_and_new_line 7
    puts_yaml_center 'game_rules1'
    puts_yaml_center 'game_rules2'
    enter_any_key('continue', :centered)
  end

  def display_shuffling
    print "=> Shuffling "

    15.times do
      print '.'
      sleep 0.1
    end

    puts " FINISHED!"
    sleep 1
  end

  def display_play_again
    new_line
    prompt_yaml 'play_again?'
  end

  def display_goodbye_message
    prompt_yaml 'goodbye'
  end
end

module Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def return_cards
    @hand = []
  end

  def displays_hand(show_first_card = true) # can hide a card
    hand = prepends_with_articles
    hand = hides_first_card unless show_first_card

    if hand.size > 2
      "#{hand[0...-1].join(', ')}, and #{hand.last}"
    else
      hand.join(' and ')
    end
  end

  def score
    num_of_aces = hand.count { |card| card.rank == :Ace }
    cards_reevaluated_for_aces(cards_initial_score, num_of_aces).sum
  end

  private

  def prepends_with_articles
    hand.map { |card| card.with_article.to_s }
  end

  def hides_first_card
    first_card = 'an unknown card'
    hand[1..-1].prepend first_card
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
  include Formatable
  include Hand
  attr_reader :name

  def initialize
    super # from Hand
    @stay = false # true means turn is over
  end

  def to_s
    name
  end

  def set_name
    try_again = nil
    prompt_yaml 'set_name1'

    loop do
      display_name_request_again if try_again
      self.name = gets.strip.split.map(&:capitalize).join(' ')
      break unless name.strip.empty?
      try_again = true
      pause 0.5
      clear_and_new_line
    end
  end

  def display_name_request_again
    prompt_yaml 'try_again1'
    pause 1
    prompt_yaml 'set_name2'
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

    stays if choice.start_with? 'S'
    hits(deck) if choice.start_with? 'H'
  end

  def hits(deck) # mutates the deck
    card = deck.cards.pop
    hand << card
    prompt "#{name} draws #{card.with_article}."
  end

  def stays
    self.stay = true
  end

  def stays?
    stay
  end

  def busts?
    score > 21
  end

  def return_cards
    super
    self.stay = false
  end

  private

  attr_accessor :stay
  attr_writer :name
end

class Dealer < Player
  AI_NAMES = ['Bender', 'Faye', 'Roy Batty', 'Data', 'Bishop', 'Dot Matrix']

  attr_writer :reveals_hidden_card

  def set_name
    self.name = AI_NAMES.sample
  end

  def chooses_move(deck)
    self.reveals_hidden_card = true
    score < 17 ? hits(deck) : stays
  end

  def secret_hand
    if reveals_hidden_card?
      displays_hand
    else
      displays_hand(false)
    end
  end

  def secret_score
    if reveals_hidden_card?
      score
    else
      '???'
    end
  end

  def return_cards
    super
    self.reveals_hidden_card = false
  end

  def reveals_hidden_card?
    @reveals_hidden_card
  end
end

class Deck
  attr_reader :cards

  def initialize
    reset
  end

  def reset
    @cards = Card::SUITS.map do |suit|
      Card::RANKS.map { |rank| Card.new(suit, rank) }
    end.flatten
  end

  def shuffle!
    cards.shuffle!
  end
end

class Card
  SUITS = [:Spades, :Hearts, :Clubs, :Diamonds]
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def with_article
    [:Ace, 8].include?(rank) ? "an #{self}" : "a #{self}"
  end
end

class TwentyOneGame
  include Formatable
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
    introduce_players
    loop do
      setup_game
      play_game
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  # setup logic

  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Metrics/MethodLength

  def introduce_players
    clear_and_new_line
    user.set_name
    dealer.set_name
    display_introductions(user, dealer)
  end

  def setup_game
    new_line
    collect_cards
    shuffle_cards
    enter_any_key('begin')
  end

  def collect_cards
    user.return_cards
    dealer.return_cards
    deck.reset
  end

  def shuffle_cards
    deck.shuffle!
    display_shuffling
  end

  # playing logic

  def play_game
    clear
    deal_cards
    display_cards
    new_line
    players_take_turns(deck)
    display_winner
  end

  def deal_cards # 2 cards to each player
    2.times do
      user.hand << deck.cards.pop
      dealer.hand << deck.cards.pop
    end
  end

  # use yaml string interpolation
  # rubocop:disable Metrics/AbcSize
  def display_cards
    ask_dealer_reveal_cards if user.busts?

    new_line
    prompt_yaml_with_var('show_hand', [name: user.name, hand: user.displays_hand, score: user.score])
    prompt_yaml_with_var('show_hand', [name: dealer.name, hand: dealer.secret_hand, score: dealer.secret_score])
  end
  # rubocop:enable Metrics/AbcSize

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
      display_cards
      break if player.busts?
      pause 1.5
    end
    prompt_yaml_with_var('player_stays', [name: player.name]) if player.stays?
  end

  def play_again?
    choices = ['Y', 'N'] # (Y)es or (N)o
    choice = nil

    loop do
      display_play_again
      choice = gets.chomp.upcase
      break if choices.include? choice[0]
      new_line
      display_try_again(choice.empty?)
    end

    choice[0] == 'Y'
  end

  # winning logic

  def display_winner
    ask_dealer_show_cards if dealer.hand.size == 2 && !user.busts?
    new_line

    if winner
      prompt_yaml_with_var('win_game', [name: winner])
    else
      prompt_yaml_with_var('tie_game', [name: dealer])
    end
  end

  def display_busts
    prompt_yaml_with_var('busts', [name: user]) if user.busts?
    prompt_yaml_with_var('busts', [name: dealer]) if dealer.busts?
  end

  def ask_dealer_show_cards
    ask_dealer_reveal_cards
    display_cards
  end

  def ask_dealer_reveal_cards
    dealer.reveals_hidden_card = true
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
end

TwentyOneGame.new.play
