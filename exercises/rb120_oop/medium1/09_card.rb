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

# =begin
deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
# =end
