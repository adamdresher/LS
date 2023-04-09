class Card
  VALUES = {'Jack'=>11, 'Queen'=>12, 'King'=>13, 'Ace'=>14}

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    value <=> other.value
  end

  def ==(other)
    value == other.value
  end

  protected

  def value
  rank.is_a?(Integer) ? rank : VALUES[rank]
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    generate_new_deck
  end

  def draw
    generate_new_deck if deck.empty?
    deck.pop
  end

  private

  attr_accessor :deck

  def generate_new_deck
    RANKS.each do |rank|
      SUITS.each { |suit| deck << Card.new(rank, suit) }
    end

    deck.shuffle!
  end
end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  def initialize(deck)
    @deck = deck
    @hand = []
    5.times { hand << deck.draw }
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  attr_accessor :deck, :hand

  def card_ranks
    hand.map { |card| card.rank }
  end

  def royal_flush?
    

    card_ranks.any? { |card| card == 'Ace' } &&
    card_ranks.any? { |card| card == 'King' } &&
    card_ranks.any? { |card| card == 'Queen' } &&
    card_ranks.any? { |card| card == 'Jack' } &&
    card_ranks.any? { |card| card == 10 } &&
    hand.count { |card| card.suit } == 5
  end

  def straight_flush?
    hand.uniq { |card| card.suit } == 1
  end

  def four_of_a_kind?
    card_ranks.uniq.any? { |card| card_ranks.count(card) == 4 }
  end

  def full_house?
    selected_cards = card_ranks.select do |card|
                       card_ranks.count(card) == 2 ||
                       card_ranks.count(card) == 3
                     end
    selected_cards.size == 5
  end

  def flush?
    hand.count { |card| card.suit } == 5
  end

  def straight?
  end

  def three_of_a_kind?
    card_ranks.uniq.any? { |card| card_ranks.count(card) == 3 }
  end

  def two_pair?
    card_ranks.select { |card| card_ranks.count(card) == 2 }.size == 2
  end

  def pair?
    card_ranks.uniq.any? { |card| card_ranks.count(card) >= 2 }
  end
end
require 'pry'
require 'pry-byebug'
# =begin
# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts 'Royal flush'
puts hand.evaluate == 'Royal flush'

# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts 'Four of a kind'
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts 'Full house'
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts 'Flush'
puts hand.evaluate == 'Flush'

# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight'
binding.pry
hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts 'Three of a kind'
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts 'Two pair'
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts 'Pair'
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts 'High card'
puts hand.evaluate == 'High card'
# =end