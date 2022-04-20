INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  (1..9).each_with_object({}) {|num, hsh| hsh[num] = INITIAL_MARKER}
end

def empty_spaces(brd)
  brd.keys.select {|key| brd[key] == INITIAL_MARKER}
end

def player_places_piece!(brd)
  loop do
    prompt("Choose a square #{empty_spaces(brd)}:")
    square = gets.chomp.to_i
    return brd[square] = PLAYER_MARKER if empty_spaces(brd).include? square

    prompt("Sorry, #{square} is an invalid square.")
  end
end

display_board(board)
player_places_piece!(board)
display_board(board)
