require 'pry'
require 'byebug'

WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                  [1, 5, 9], [3, 5, 7]] # diagonals

INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
BOARD_SPACE = "     |     |"
BOARD_LINE = "-----+-----+-----"


def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

def new_line
  puts
end

def screen_pause
  sleep 1
end

def initialize_board
  (1..9).each_with_object({}) { |num, hsh| hsh[num] = INITIAL_MARK }
end

def initialize_score
  { player: 0, computer: 0 }
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, scr)
  clear_screen
  puts "You're a #{PLAYER_MARK}.         Computer is #{COMPUTER_MARK}."
  puts "Player has won: #{scr[:player]}.  Computer has won: #{scr[:computer]}."
  new_line
  puts BOARD_SPACE
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts BOARD_SPACE
  puts BOARD_LINE
  puts BOARD_SPACE
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts BOARD_SPACE
  puts BOARD_LINE
  puts BOARD_SPACE
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts BOARD_SPACE
  new_line
end
# rubocop:enable Metrics/AbcSize

def welcome_player
  clear_screen
  4.times { new_line }
  prompt "Welcome to Tic tac toe!\
  The first one to win 5 matches will win the game, good luck!"
  new_line
end

def choose_who_starts
  loop do
    prompt "Choose who starts the game, player (1) or computer (2):"
    first = gets.chomp.to_i

    order = first == 1 ? :player : :computer
    return order if first == 1 || 2
    prompt "Sorry, that's an invalid entry.  Please try again."
  end
end

def play_piece!(brd, marker)
  if marker == :player
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_marker(marker)
  marker == :player ? :computer : :player
end

def player_places_piece!(brd)
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    return brd[square] = PLAYER_MARK if empty_squares(brd).include? square

    prompt "Sorry, #{square} is an invalid square."
  end
end

# rubocop:disable Lint/Syntax
def joinor(arr)
  case arr.size
  when 3.. then arr.join(', ').insert(-2, ' or ')
  when 2   then arr.join(' or ')
  when 1   then arr
  else          ''
  end
end

def computer_places_piece!(brd)
  square = case
           when !find_at_risk_square(brd, COMPUTER_MARK) &&
                !find_at_risk_square(brd, PLAYER_MARK)   &&
                brd[5] == ' '                           then 5
           when find_at_risk_square(brd, COMPUTER_MARK) then ai_move(brd, COMPUTER_MARK)
           when find_at_risk_square(brd, PLAYER_MARK)   then ai_move(brd, PLAYER_MARK)
           else                                              random_move(brd)
           end

  brd[square] = COMPUTER_MARK
end
# rubocop:enable Lint/Syntax

def find_at_risk_square(brd, marker)
  WINNING_COMBOS.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).include?(INITIAL_MARK)
      line.each { |mark| return mark if brd[mark] == ' ' }
    end
  end
  nil
end

def ai_move(brd, marker)
  find_at_risk_square(brd, marker)
end

def empty_squares(brd)
  brd.keys.select { |key| brd[key] == INITIAL_MARK }
end

def random_move(brd)
  empty_squares(brd).sample
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, scr, lvl)
  lvl == :match ? !!detect_match_winner(brd) : !!detect_set_winner(scr)
end

def detect_match_winner(brd)
  WINNING_COMBOS.each do |line|
    return 'Player' if line.all? { |mark| brd[mark] == PLAYER_MARK }
    return 'Computer' if line.all? { |mark| brd[mark] == COMPUTER_MARK }
  end
  nil
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
  welcome_player

  loop do # game set
    board = initialize_board
    current_marker = choose_who_starts

    loop do # game match
      # binding.pry
      display_board(board, score)
      play_piece!(board, current_marker)
      current_marker = alternate_marker(current_marker)
      break if someone_won?(board, score, :match) || board_full?(board)
    end

    if someone_won?(board, score, :match)
      add_match_point(board, score)

      prompt "#{detect_match_winner(board)} won the match!"
      new_line
      prompt "Score: Player - #{score[:player]}, Computer - #{score[:computer]}"
    else
      prompt "It's a tie!"
    end

    screen_pause
    break if someone_won?(board, score, :set)
  end

  clear_screen
  prompt "#{detect_set_winner(score)} won the game!"
  new_line
  prompt "Play again? [y or no]"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thanks for playing Tic Tac Toe.  Goodbye!"
