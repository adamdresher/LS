# mirroring half of a diamond
# class Diamond
#   class << self
#     def make_diamond(char)
#       return "#{char}\n" if char == 'A'
#       top_half = half_diamond(('A'..char.upcase).to_a)
#       bottom_half = top_half[0..-2].reverse

#       (top_half + bottom_half).join
#     end

#     private

#     def half_diamond(lines)
#       lines.map.with_index { |line, idx| horizontal_format(lines.size, line, idx) }
#     end

#     def horizontal_format(length, char, idx)
#         whitespaces = whitespaces(idx, length - 1)
#         shape = shape_filling(char, idx)

#         whitespaces + shape + whitespaces + "\n"
#     end

#     def whitespaces(current_idx, last_idx)
#       ' ' * (last_idx - current_idx)
#     end

#     def shape_filling(char, idx)
#       return char if char == 'A'
#       fill_size = idx == 0 ? '' : (idx * 2 - 1)

#       char + ' ' * fill_size + char
#     end
#   end
# end

# mirroring quarter of a diamond
class Diamond
  class << self
    def make_diamond(last_letter)
      @last_letter = last_letter
      top_half = create_half
      bottom_half = top_half[0..-2].reverse
      (top_half + bottom_half).join
    end

    private

    def create_half
      left_quarter = create_quarter
      right_quarter = left_quarter.map { |line| line[..-2].reverse }

      left_quarter.map.with_index do |line, idx|
        line + right_quarter[idx] + "\n"
      end
    end

    def create_quarter
      letters = ('A'..@last_letter).to_a
      quarter = Array.new(letters.size).map { ' ' * letters.size }

      # locates position in the top left quarter
      # then replaces whitespace with letter
      letters.each_with_index do |letter, idx|
        reverse_idx = -(idx+1)
        quarter[idx][reverse_idx] = letter
      end
      quarter
    end
  end
end
