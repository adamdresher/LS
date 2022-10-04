class Card
  include Comparable

  RANKING = { 'Jack'=>11, 'Queen'=>12, 'King'=>13, 'Ace'=>14 }
  SUITS = { 'Diamonds'=>1, 'Clubs'=>2, 'Hearts'=>3, 'Spades'=>4 }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def <=>(other)
    if value != other.value
      value <=> other.value
    else
      SUITS[suit] <=> SUITS[other.suit]
    end
  end

  def ==(other)
    value == other.value && suit == other.suit
  end

  protected

  def value
  rank.is_a?(Integer) ? rank : RANKING[rank]
  end
end

=begin
# example of class in use:
cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
=end

# =begin
# examples for further exploration:
cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min > Card.new(2, 'Diamonds')
puts cards.max < Card.new('Ace', 'Spades')

cards = [Card.new(5, 'Hearts')]
puts cards.min > Card.new(5, 'Clubs')
puts cards.max > Card.new(5, 'Clubs')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max < Card.new(10, 'Spades')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min < Card.new(7, 'Clubs')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min < Card.new(8, 'Spades')
puts cards.max == Card.new(8, 'Spades')
# =end
