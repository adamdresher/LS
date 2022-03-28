def print_in_box(string)
  str_width = string.length
  box = [
  '+--+',
  '|  |',
  '|  |',
  '|  |',
  '+--+'
]

box[0].insert(2, ('-' * str_width))
box[1].insert(2, (' ' * str_width))
box[2].insert(2, string)
box[3].insert(2, (' ' * str_width))
box[4].insert(2, ('-' * str_width))

puts box
end

# Solution 2.  Further Exploration.
LENGTH_MAX = 76

def split_text(string)
  return "| #{string.slice!(0..)} |" if string.length <= 80

  multiline_text = []
  loop do
    if string.length > LENGTH_MAX
      multiline_text << "| #{string.slice!(0..75)} |"
    else
      filler = ' ' * (LENGTH_MAX - string.length)
      multiline_text << "| #{string.slice!(0..)}#{filler} |"
    end
    break if string.length == 0
  end

  multiline_text
end

def print_in_box(string)
  (string.length > LENGTH_MAX) ? (width = LENGTH_MAX) : (width = string.length)

  horizontal_line = "+#{'-' * (width + 2)}+"
  buffer_line     = "|#{' ' * (width + 2)}|"
  message         = split_text(string)

  puts horizontal_line
  puts buffer_line
  puts message
  puts buffer_line
  puts horizontal_line
end

print_in_box('To boldly go where no one has gone before. Whubba lub dub dub '\
  'the cat and the hat the cow jumped over the moon whoopdie doo! Lorem ipsum '\
  'dolor sit amet, consectetur adipiscing elit. Pellentesque rutrum dolor erat, '\
  'vel egestas tellus mollis ut. Donec vulputate, felis vitae lobortis fringilla, '\
  'ex ligula tempor diam, sed posuere lorem dui ac sapien. Vestibulum at '\
  'condimentum lectus. Vivamus imperdiet sapien ligula, at faucibus felis aliquam '\
  'et. Aliquam vitae mollis dui. Nam sit amet vulputate risus, ac sagittis ligula. '\
  'Maecenas ut mi bibendum, placerat dui sit amet, pharetra enim. Proin scelerisque '\
  'non sem lobortis convallis. Praesent non diam in nisi sagittis sagittis. Mauris '\
  'cursus felis nec lorem ornare volutpat. Donec id turpis neque. Nullam nunc arcu, '\
  'eleifend a maximus sed, vulputate id purus. Praesent eu mauris lacus. Mauris a '\
  'ornare lectus')