require 'pry'
require 'byebug'

WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                  [1, 5, 9], [3, 5, 7]] # diagonals

BOARD_SPACE = "     |     |"
BOARD_LINE = "-----+-----+-----"
INITIAL_MARK = ' '
mark = {}

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
  puts "You're a #{mark[:player]}.         Computer is #{mark[:computer]}."
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
  6.times { new_line }
  puts ' ' * 14 + "Welcome to Tic tac toe!"
  2.times { screen_pause}
  clear_screen

  6.times { new_line }
  puts ' ' * 4 + "The first one to win 5 matches will win the game, good luck!"
  3.times { screen_pause}
  clear_screen
end

def choose_who_starts
  loop do
    prompt "Choose who starts the game, player (1) or computer (2):"
    order_choice = gets.chomp.to_i

    first = order_choice == 1 ? :player : :computer
    return first if order_choice == 1 || order_choice == 2

    prompt "Sorry, that's an invalid entry.  Please try again."
  end
  clear_screen
end

def choose_mark
  loop do
    prompt "Would you like to be 'X' or 'O'?"
    mark = gets.chomp.upcase

    return mark if mark == 'X' || mark == 'O'
    prompt "Sorry, that's an invalid entry.  Please try again."
  end
end

def other_mark(player_mark)
  mark_options = ['X', 'O']
  mark_options.delete(player_mark)
  mark_options[0]
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
    return brd[square] = mark[:player] if empty_squares(brd).include? square

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
           when !find_at_risk_square(brd, mark[:computer]) &&
                !find_at_risk_square(brd, mark[:player])   &&
                brd[5] == ' '                           then 5
           when find_at_risk_square(brd, mark[:computer]) then ai_move(brd, mark[:computer])
           when find_at_risk_square(brd, mark[:player])   then ai_move(brd, mark[:player])
           else                                              random_move(brd)
           end

  brd[square] = mark[:computer]
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
    return 'Player' if line.all? { |mark| brd[mark] == mark[:player] }
    return 'Computer' if line.all? { |mark| brd[mark] == mark[:computer] }
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

loop do # main loop
  score = initialize_score
  welcome_player

  loop do # game set
    board = initialize_board
    default_starter = choose_who_starts
    mark[:player] = choose_mark
    mark[:computer] = other_mark(mark[:player])

    loop do # game match
      # binding.pry
      current_marker = default_starter
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
2.times { clear_screen }
clear_screen
