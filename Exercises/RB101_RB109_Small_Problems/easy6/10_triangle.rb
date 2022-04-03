# frozen_string_literal: true

# def triangle(length)
#   stars = 0
#   length.times do
#     stars += 1
#     puts ' ' * (length - stars) + ('*' * stars)
#   end
# end

# Solution 2.
# frozen_string_literal: true

def print_triangle(length, corner)
  diagonal_spaces = 0

  until diagonal_spaces == length
    diagonal_spaces += 1
    puts case corner
         when 1
             '*' * (length - diagonal_spaces + 1)
         when 2
           ' ' * diagonal_spaces + '*' * (length - diagonal_spaces + 1)
         when 3
           '*' * diagonal_spaces
         when 4
           ' ' * (length - diagonal_spaces) + '*' * diagonal_spaces
         end
  end
end

def triangle(length)
  which_corner = <<-MSG

You've entered #{length} for the length of a triangle.
What corner would you like to display the triangle's right angle?

  1) upper left
  2) upper right
  3) lower left
  4) lower right

  Enter 1, 2, 3, or 4:
  MSG

  puts which_corner
  corner = gets.chomp.to_i

  puts "\n"
  print_triangle(length, corner)
end

p triangle(5)

#     *
#    **
#   ***
#  ****
# *****
