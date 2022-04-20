require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
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

def empty_squares(brd)
  brd.keys.select {|key| brd[key] == INITIAL_MARKER}
end

def player_places_piece!(brd)
  loop do
    prompt("Choose a square #{empty_squares(brd)}:")
    square = gets.chomp.to_i
    return brd[square] = PLAYER_MARKER if empty_squares(brd).include? square

    prompt("Sorry, #{square} is an invalid square.")
  end
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  false
end

board = initialize_board

loop do
  display_board(board)
  player_places_piece!(board)
  computer_places_piece!(board)
  display_board(board)
  break if someone_won?(board) || board_full?(board)
end
