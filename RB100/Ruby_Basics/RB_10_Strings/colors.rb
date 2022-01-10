colors = 'blue pink yellow orange'

# 'yellow', 'purple'
# puts true
# split_colors = colors.split # .each { |color| (color == yellow ? puts 'true' : 'false') }
# colors.split.each { |color| puts true if color == 'yellow' }
puts colors.include?('yellow')
puts colors.include?('purple')

puts colors.match?('yellow')
puts colors.match?('purple')
