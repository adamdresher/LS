# frozen_string_literal: true

# def penultimate(string)
#   string.split[-2]
# end

# Further Exploration.
def penultimate(string)
  return '' if string.empty?

  words = string.split
  middle = words.size / 2.0

  words.size.odd? ? words[middle] : [words[middle-1], words[middle]].join(' ')
  # missing whitespaces around #- to keep line count < 80
end

p penultimate('last word') # 'last'
p penultimate('Launch School is great!') # 'is'
# Further Exploration:
p penultimate('last word') == 'last word'
p penultimate('Launch School is great!') == 'School is'
p penultimate('Moses supposes his toeses are roses') == 'his'
p penultimate('')
