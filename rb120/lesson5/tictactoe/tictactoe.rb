require 'pry'
require 'pry-byebug'

module Displayable
  def clear
    system 'clear'
  end
  
  def prompt(msg)
    puts "=> #{msg}"
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                   [1, 5, 9], [3, 5, 7]]            # diagonals

  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |square| @squares[square].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker # returns winning marker or nil
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)

      if !squares.first.unmarked? && all_markers_match?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |num| @squares[num] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "              |     |"
    puts "           #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "              |     |"
    puts "         -----------------"
    puts "              |     |"
    puts "           #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "              |     |"
    puts "         -----------------"
    puts "              |     |"
    puts "           #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "              |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def all_markers_match?(squares)
    squares.map(&:marker).uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :name, :marker
end

class TTTGame
  include Displayable

  COMPUTER_NAMES = ['Bender', 'Bishop', 'Data', 'R2D2', 'Roy Batty']

  attr_accessor :current_player, :score
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    @current_player = human
    @score = { human => 0, computer => 0 }
  end

  def play
    display_greeting_message
    setup_players
    play_game
    display_goodbye_message
  end

  private

  def display_greeting_message
    clear
    puts "\n\n\n\n\n\n"
    puts "          Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing!  Goodbye!"
  end

  def setup_players
    get_human_name
    puts
    get_human_marker
    set_computer_name_and_marker
  end

  def get_human_name
    puts "Please enter your name:"
    human.name = gets.chomp.capitalize
  end

  def get_human_marker
    puts "Thanks, #{human.name}."
    loop do
      puts "Which marker would you like to play as?  (X or O)"
      user_marker = gets.chomp.upcase
      human.marker = user_marker
      break if ['X', 'O'].include? user_marker
      puts "Sorry, that's not a marker.  Please try again."
    end
  end

  def set_computer_name_and_marker
    computer.name = COMPUTER_NAMES.sample
    computer.marker = ['X', 'O'].reject { |option| option == human.marker }.first
  end

  def play_game
    loop do
      clear_screen_and_display_board
      players_move
      add_point_to_winner
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def clear_screen_and_display_board
    clear
    puts scoreboard
    puts
    puts "----------------------------------------------"
    puts
    board.draw
    puts
  end

  def scoreboard
    "\n          #{human.name}       #{computer.name}\n\n\
----------------------------------------------\n\n\
  Score:   #{score[human]}           #{score[computer]}\n\n\
  Marker:  #{human.marker}           #{computer.marker}\n"
  end

  def display_result
    clear_screen_and_display_board
    puts case board.winning_marker
         when human.marker    then "You win!"
         when computer.marker then "The computer has won!"
         else                      "It's a tie."
         end
  end

  def display_play_again_message
    puts "Okay.  Let's play again!"
    puts
  end

  def players_move
    loop do
      current_player_moves
      clear_screen_and_display_board
      break if board.someone_won? || board.full?
    end
  end

  def current_player_moves
    if current_player == human
      human_moves
      self.current_player = computer
    else
      computer_moves
      self.current_player = human
    end
  end

  def human_moves
    square = nil
    puts "Choose a square (#{remaining_squares}):"

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def remaining_squares
    squares = board.unmarked_keys

    if squares.size > 2
      "#{squares[0...-1].join(', ')} or #{squares.last.to_s}"
    else
      squares.join(' or ')
    end
  end

  def computer_moves
    if computer_can_win?
      computer_moves_offensive
    elsif computer_can_defend?
      computer_moves_defensively
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def computer_can_win?
    player_has_two_squares?(computer)
  end

  # computer ai: offense
  # recognize 2 squares marked by self and attack
  def computer_moves_offensive
    square = winnable_line(computer)
    board[square] = computer.marker
  end

  def computer_can_defend?
    player_has_two_squares?(human)
  end

  # computer ai: defense
  # recognize 2 squares marked by opponent and defend
  def computer_moves_defensively
    square = winnable_line(human)
    board[square] = computer.marker
  end

  def player_has_two_squares?(player)
    winnable_line(player).class == Integer
  end

  def winnable_line(player) # returns a Square if winnable line found, or Array if not found
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line).map(&:marker)
      if squares.count(player.marker) == 2 && squares.count(Square::INITIAL_MARKER) == 1
        return select_empty_square(line)
      end
    end
  end

  def select_empty_square(squares) # returns an integer
    squares.select { |square| board.squares[square].unmarked? }.first
  end

  def add_point_to_winner
    winner = case board.winning_marker
             when human.marker    then human
             when computer.marker then computer
             else
             end
    score[winner] += 1 if winner
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y / n)"
      answer = gets.chomp.downcase
      break if %(y n).include? answer[0]
      puts "Sorry, I didn't understand that.  Can you rephrase that?"
    end

    answer.start_with? 'y'
  end

  def reset
    board.reset
    # clear
    # self.current_player = human
  end
end

game = TTTGame.new
game.play
