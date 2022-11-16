class BeerSong
  line1 = Proc.new do
    "#{@num} bottle#{@quantity} of beer on the wall, #{@num} \
bottle#{@quantity} of beer.\n"
  end
  line2 = Proc.new do # 0, 1, or 2+ bottles
    ["Go to the store and buy some more, 99 bottles of beer on the wall.\n",
     "Take it down and pass it around, no more bottles of beer on the wall.\n",
     "Take one down and pass it around, #{@ending_num - 1} \
bottle#{@ending_quantity} of beer on the wall.\n"]
  end

  CHORUS = { line1: line1, line2: line2 }

  class << self
    def verse(num)
      @num = num.zero? ? 'no more' : num
      @ending_num = num.zero? ? 99 : num
      @quantity = start_quantity(num)
      @ending_quantity = ending_quantity(num)
      line2_variant = (num > 1 ? 2 : num)

      CHORUS[:line1].call.capitalize + CHORUS[:line2].call[line2_variant]
    end

    def verses(first_verse, last_verse)
      (last_verse..first_verse).to_a.reverse.map { |i| verse(i) }.join("\n")
    end

    def lyrics
      verses(99, 0)
    end

    def start_quantity(num)
      plural?(num) ? 's' : ''
    end

    def ending_quantity(num)
      num - 1 == 1 ? '' : 's'
    end

    def plural?(num)
      num > 1 || num.zero?
    end
  end
end
