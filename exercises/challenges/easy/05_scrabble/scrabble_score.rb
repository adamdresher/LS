class Scrabble
  TILE_POINTS =
    {
      0  => [" ", "\n"],
      1  => %w(a e i o u l n r s t),
      2  => %w(d g),
      3  => %w(b c m p),
      4  => %w(f h v w y),
      5  => %w(k),
      8  => %w(j x),
      10 => %w(q z)
    }

  def initialize(word)
    @word = word ? word.downcase : '' # converts nil to ''
    @total = 0
  end

  def score
    TILE_POINTS.each do |point, letters|
      quantity = @word.chars.count { |char| letters.include? char }
      @total += point * quantity
    end

    @total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

# 2nd approach
# class Scrabble
#   TILE_POINTS =
#     {
#       0  => [" ", "\t", "\n"],
#       1  => %w(a e i o u l n r s t), # alarit
#       2  => %w(d g),
#       3  => %w(b c m p), # c
#       4  => %w(f h v w y), # y
#       5  => %w(k),
#       8  => %w(j x),
#       10 => %w(q z)
#     }

#   def initialize(word)
#     @word = word ? word.downcase : ''
#     @total = 0
#   end

#   def score # 
#     @word.chars.tally.each do |letter, quantity|
#       @total += TILE_POINTS.select { |k, v| v.include? letter }.keys.first * quantity
#     end
#     @total
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end

# 3rd approach
# class Scrabble
#   TILE_POINTS =
#     {
#       [" ", "\t", "\n"] => 0 ,
#       %w(a e i o u l n r s t) => 1 ,
#       %w(d g) => 2 ,
#       %w(b c m p) => 3 ,
#       %w(f h v w y) => 4 ,
#       %w(k) => 5 ,
#       %w(j x) => 8 ,
#       %w(q z) => 10
#     }

#   def initialize(word)
#     @word = word ? word.downcase : ''
#     @total = 0
#   end

#   def score
#     @word.chars.each do |letter|
#       TILE_POINTS.each do |letters, point|
#         @total += point if letters.include?(letter)
#       end
#     end
#     @total
#   end

#   def self.score(word)
#     Scrabble.new(word).score
#   end
# end
