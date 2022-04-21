require 'pry'
require 'byebug'

WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                  [1, 5, 9], [3, 5, 7]] # diagonals

INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def new_line
  puts
end

def screen_pause
  sleep 1
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, scr)
  system 'clear'
  puts "You're a #{PLAYER_MARK}.         Computer is #{COMPUTER_MARK}."
  puts "Player has won: #{scr[:player]}.  Computer has won: #{scr[:computer]}."
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
# rubocop:enable Metrics/AbcSize

def initialize_board
  (1..9).each_with_object({}) { |num, hsh| hsh[num] = INITIAL_MARK }
end

def initialize_score
  { player: 0, computer: 0 }
end

def empty_squares(brd)
  brd.keys.select { |key| brd[key] == INITIAL_MARK }
end

def joinor(arr)
  case arr.size
  when 3.. then arr.join(', ').insert(-2, ' or ')
  when 2   then arr.join(' or ')
  when 1   then arr
  else          ''
  end
end

def player_places_piece!(brd)
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}:"
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

def someone_won_match?(brd)
  !!detect_match_winner(brd)
end

def detect_match_winner(brd)
  WINNING_COMBOS.each do |line|
    return 'Player' if line.all? { |mark| brd[mark] == PLAYER_MARK }
    return 'Computer' if line.all? { |mark| brd[mark] == COMPUTER_MARK }
  end
  nil
end

def someone_won_set?(brd, scr)
  !!detect_set_winner(scr)
end

def detect_set_winner(scr)
  return 'Player' if scr[:player] == 5
  return 'Computer' if scr[:computer] == 5
  nil
end

def add_match_point(brd, scr)
  return scr[:player] += 1 if detect_match_winner(brd) == 'Player'
  return scr[:computer] += 1 if detect_match_winner(brd) == 'Computer'
end

# gameplay
loop do # play again?
  score = initialize_score

  loop do # game set
    board = initialize_board

    loop do # game match
      display_board(board, score)

      player_places_piece!(board)
      break if someone_won_match?(board) || board_full?(board)

      computer_places_piece!(board)
      display_board(board, score)
      break if someone_won_match?(board) || board_full?(board)
    end

    display_board(board, score)

    if someone_won_match?(board)
      add_match_point(board, score)

      prompt "#{detect_match_winner(board)} won the match!"
      new_line
      prompt "The score is now: Player - #{score[:player]}, Computer - #{score[:computer]}"
    else
      prompt "It's a tie!"
    end

    screen_pause
    break if someone_won_set?(board, score)
  end

  system 'clear'
  prompt "#{detect_set_winner(score)} won the game!"
  new_line
  prompt "Play again? [y or no]"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thanks for playing Tic Tac Toe.  Goodbye!"
