# frozen_string_literal: true

def triangle(length)
  stars = 0
  length.times do
    stars += 1
    puts ' ' * (length - stars) + ('*' * stars)
  end
end

triangle(9)
