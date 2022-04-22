require 'pry'
require 'byebug'

WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                  [1, 5, 9], [3, 5, 7]] # diagonals

SCORE_BUFFER = ' ' * 17
BOARD_BUFFER = ' ' * 26
BOARD_SPACE = BOARD_BUFFER + "     |     |"
BOARD_LINE = BOARD_BUFFER + "-----+-----+-----"
INITIAL_MARK = ' '
mrk = {}

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

def new_line
  puts
end

def screen_pause(time)
  sleep(time)
end

def initialize_board
  (1..9).each_with_object({}) { |num, hsh| hsh[num] = INITIAL_MARK }
end

def initialize_score
  { player: 0, computer: 0 }
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, scr, mrk)
  clear_screen
  puts SCORE_BUFFER +
    "You're a #{mrk[:player]}.         Computer is #{mrk[:computer]}."
  puts SCORE_BUFFER +
    "Player has won: #{scr[:player]}.  Computer has won: #{scr[:computer]}."
  new_line
  puts BOARD_SPACE
  puts BOARD_BUFFER + "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts [BOARD_SPACE, BOARD_LINE, BOARD_SPACE]
  puts BOARD_BUFFER + "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts [BOARD_SPACE, BOARD_LINE, BOARD_SPACE]
  puts BOARD_BUFFER + "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts BOARD_SPACE
  new_line
end
# rubocop:enable Metrics/AbcSize

def welcome_player
  clear_screen
  6.times { new_line }
  puts ' ' * 23 + "Welcome to Tic Tac Toe!"
  screen_pause(1)
  clear_screen

  6.times { new_line }
  puts ' ' * 5 + "The first one to win 5 matches will win the game, good luck!"
  screen_pause(1)
end

def choose_who_starts
  loop do
    clear_screen
    6.times { new_line }
    puts ' ' * 5 + "The first one to win 5 matches will win the game, good luck!"
    7.times { new_line }
    prompt "Choose who starts the game, player (1) or computer (2):"
    order_choice = gets.chomp.to_i

    first = order_choice == 1 ? :player : :computer
    if order_choice == 1 || order_choice == 2
      screen_pause(0.5)
      return first
    end

    prompt "Sorry, that's an invalid entry.  Please try again."
    screen_pause(1)
  end
end

def choose_mark
  loop do
    clear_screen
    6.times { new_line }
    puts ' ' * 5 + "The first one to win 5 matches will win the game, good luck!"
    7.times { new_line }
    prompt "Would you like to be 'X' or 'O'?"
    mark = gets.chomp.upcase

    if mark == 'X' || mark == 'O'
      screen_pause(0.5)
      return mark
    end

    prompt "Sorry, that's an invalid entry.  Please try again."
    screen_pause(1)
  end
end

def other_mark(chosen_mark)
  mark_options = ['X', 'O']
  mark_options.delete(chosen_mark)
  mark_options[0]
end

def play_piece!(brd, mrkr, mrk)
  if mrkr == :player
    player_places_piece!(brd, mrk)
  else
    computer_places_piece!(brd, mrkr, mrk)
  end
end

def alternate_marker(mrkr)
  mrkr == :player ? :computer : :player
end

def player_places_piece!(brd, mrk)
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    return brd[square] = mrk[:player] if empty_squares(brd).include? square

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

def computer_places_piece!(brd, mrkr, mrk)
  player_at_risk   = find_at_risk_square(brd, :player, mrk[:player])
  computer_at_risk = find_at_risk_square(brd, :computer, mrk[:computer])

  no_alarms      = !computer_at_risk && !player_at_risk && brd[5] == ' '
  offensive_move = ai_move(brd, :computer, mrk[:computer])
  defensive_move = ai_move(brd, :player, mrk[:player])

  square = case
           when no_alarms        then 5
           when computer_at_risk then offensive_move
           when player_at_risk   then defensive_move
           else                       random_move(brd)
           end

  brd[square] = mrk[:computer]
end
# rubocop:enable Lint/Syntax

def find_at_risk_square(brd, mrkr, mrk)
  WINNING_COMBOS.each do |line|
    if brd.values_at(*line).count(mrk) == 2 &&
       brd.values_at(*line).include?(INITIAL_MARK)
      line.each { |square| return square if brd[square] == ' ' }
    end
  end
  nil
end

def ai_move(brd, mrkr, mrk)
  find_at_risk_square(brd, mrkr, mrk)
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

def someone_won?(brd, scr, mrk, lvl)
  lvl ==
    :match ? !!detect_match_winner(brd, mrk) : !!detect_set_winner(scr)
end

def detect_match_winner(brd, mrk)
  WINNING_COMBOS.each do |line|
    return 'Player' if line.all? { |square| brd[square] == mrk[:player] }
    return 'Computer' if line.all? { |square| brd[square] == mrk[:computer] }
  end
  nil
end

def detect_set_winner(scr)
  return 'Player' if scr[:player] == 5
  return 'Computer' if scr[:computer] == 5
  nil
end

def add_match_point(brd, scr, mrk)
  return scr[:player] += 1 if detect_match_winner(brd, mrk) == 'Player'
  return scr[:computer] += 1 if detect_match_winner(brd, mrk) == 'Computer'
end

# gameplay

loop do # main loop
  score = initialize_score
  welcome_player
  default_starter = choose_who_starts
  mrk[:player] = choose_mark
  mrk[:computer] = other_mark(mrk[:player])

  loop do # game set
    board = initialize_board
    current_marker = default_starter

    loop do # game match
      display_board(board, score, mrk)
      play_piece!(board, current_marker, mrk)
      current_marker = alternate_marker(current_marker)
      display_board(board, score, mrk) # shows winning move
      break if someone_won?(board, score, mrk, :match) || board_full?(board)
    end

    if someone_won?(board, score, mrk, :match)
      add_match_point(board, score, mrk)

      prompt "#{detect_match_winner(board, mrk)} won the match!"
      new_line
      prompt "Score: Player - #{score[:player]}, Computer - #{score[:computer]}"
    else
      prompt "It's a tie!"
    end

    screen_pause(1)
    break if someone_won?(board, score, mark, :set)
  end

  clear_screen
  prompt "#{detect_set_winner(score)} won the game!"
  new_line
  prompt "Play again? [y or no]"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt "Thanks for playing Tic Tac Toe.  Goodbye!"
screen_pause(2)
clear_screen
