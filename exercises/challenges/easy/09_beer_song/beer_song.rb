class BeerSong
  # rubocop:disable Layout/LineLength
  line1 = Proc.new do
    "#{@num} bottle#{@quantity} of beer on the wall, #{@num} bottle#{@quantity} of beer.\n"
  end

  line2 = Proc.new do # 0, 1, or 2+ bottles
    ["Go to the store and buy some more, 99 bottles of beer on the wall.\n",
     "Take it down and pass it around, no more bottles of beer on the wall.\n",
     "Take one down and pass it around, #{@ending_num - 1} bottle#{@ending_quantity} of beer on the wall.\n"]
  end
  # rubocop:enable Layout/LineLength

  VERSE = { line1: line1, line2: line2 }

  class << self
    def verse(num)
      @num = num.zero? ? 'no more' : num
      @quantity = starting_quantity(num)
      @ending_num = num.zero? ? 100 : num
      @ending_quantity = ending_quantity(num)
      line2_variant = num > 1 ? 2 : num

      VERSE[:line1].call.capitalize + VERSE[:line2].call[line2_variant]
    end

    def verses(first_verse, last_verse)
      (last_verse..first_verse).to_a.reverse.map { |i| verse(i) }.join("\n")
    end

    def lyrics
      verses(99, 0)
    end

    private

    def starting_quantity(num)
      plural?(num) ? 's' : ''
    end

    def ending_quantity(num)
      num == 2 ? '' : 's'
    end

    def plural?(num)
      num > 1 || num.zero?
    end
  end
end
