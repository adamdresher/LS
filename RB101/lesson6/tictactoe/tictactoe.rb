INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARK}.  Computer is #{COMPUTER_MARK}."
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
  (1..9).each_with_object({}) {|num, hsh| hsh[num] = INITIAL_MARK}
end

def empty_squares(brd)
  brd.keys.select {|key| brd[key] == INITIAL_MARK}
end

def player_places_piece!(brd)
  loop do
    prompt "Choose a square #{empty_squares(brd)}:"
    square = gets.chomp.to_i
    return brd[square] = PLAYER_MARK if empty_squares(brd).include? square

    prompt "Sorry, #{square} is an invalid square."
  end
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARK
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                    [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                    [1, 5, 9], [3, 5, 7]] # diagonals

  winning_combos.each do |line|
    return 'Player' if line.all? {|mark| brd[mark] == PLAYER_MARK}
    return 'Computer' if line.all? {|mark| brd[mark] == COMPUTER_MARK}
  end
  nil
end

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if (someone_won?(board) || board_full?(board))

    computer_places_piece!(board)
    display_board(board)
    break if (someone_won?(board) || board_full?(board))
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? [y or no]"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thanks for playing Tic Tac Toe.  Goodbye!"
