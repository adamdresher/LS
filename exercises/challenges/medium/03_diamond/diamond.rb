class Diamond
  class << self
    def make_diamond(char)
      return "#{char}\n" if char == 'A'

      top_half = half_diamond(('A'..char.upcase).to_a)
      bottom_half = top_half[0..-2]
      top_half + bottom_half
    end

    private

    def half_diamond(letters)
      letters.map.with_index { |line, idx| horizontal_format(line, idx) }
    end

    def horizontal_format(line, idx)
      line.chars.map do |char|
        whitespaces = whitespaces(idx, line.size - 1)
        shape = shape_filling(char, idx)

        whitespaces + shape + whitespaces + "\n"
      end.join
    end

    def whitespaces(current_idx, last_idx) # ['A', 'B', 'C'] => 2, 2
      ' ' * (last_idx - current_idx) # 1 - 1
    end

    def shape_filling(char, idx)
      return char if char == 'A'
      char + ' ' * (idx * 2 - 1) + char
    end
  end
end
