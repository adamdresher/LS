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

  def set_help
    (1..9).each { |num| @squares[num] = num }
    self
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
  HELP_BOARD = Board.new.set_help

  attr_accessor :current_player, :score, :first_to_play
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    @first_to_play = nil
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
    puts
    puts "          Press (Enter) to begin."
    gets
  end

  def setup_players
    clear
    puts
    set_computer_name
    get_human_name
    puts
    get_human_marker
    set_computer_marker
    puts
    decide_who_starts
  end

  def set_computer_name
    computer.name = COMPUTER_NAMES.sample
  end

  def get_human_name
    loop do
    prompt "Please enter your name:"
    human.name = gets.chomp.capitalize
    break unless human.name.empty?
    prompt "Sorry, that's an invalid entry."
    end
  end

  def get_human_marker
    prompt "Thanks #{human.name}.  You'll be playing against #{computer.name}."
    loop do
      prompt "Which marker would you like to play as?  (X or O)"
      user_marker = gets.chomp.upcase
      human.marker = user_marker
      break if ['X', 'O'].include? user_marker
      prompt "Sorry, that's not a marker.  Please try again."
    end
  end

  def set_computer_marker
    options = ['X', 'O']
    computer.marker = options.reject { |option| option == human.marker }.first
  end

  def decide_who_starts
    choice = nil
    prompt "Now let's figure out who starts."

    loop do
      puts "     Press (1) to start."
      puts "     Press (2) to let the #{computer.name} start."
      puts "     Press (3) to leave it up to chance."
      choice = gets.chomp
      break if %(1 2 3).include? choice
      prompt "Sorry, that's an invalid choice.  Please try again."
    end

    self.first_to_play = case choice
                         when '1' then human # not playing human
                         when '2' then computer
                         when '3' then [human, computer].sample
                         end
    self.current_player = first_to_play
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
    puts help
    display_scoreboard
    board.draw
    puts
  end

  def help
    "Press (H) for help identifying the square #."
  end

  def display_help # helps user identify square numbers
    clear
    puts
    display_scoreboard
    HELP_BOARD.draw
    puts
    puts "          Press (Enter) to begin."
    gets
    clear_screen_and_display_board
  end

  def display_scoreboard
    puts horizontal_line
    puts scoreboard
    puts
    puts horizontal_line
    puts
  end
       
  def scoreboard
    "\n          #{human.name}       #{computer.name}\n\n\
#{horizontal_line}\n\n\
  Score:   #{score[human]}#{name_padding}#{score[computer]}\n\n\
  Marker:  #{human.marker}#{name_padding}#{computer.marker}\n"
  end

  def display_result
    clear_screen_and_display_board
    prompt case board.winning_marker
         when human.marker    then "You win!"
         when computer.marker then "The computer has won!"
         else                      "It's a tie."
         end
  end

  def horizontal_line # corrects for long names
    names_length = human.name.size + computer.name.size + 20
    
    '-' * [50, names_length].max
  end

  def name_padding # corrects for long names
    ' ' * (human.name.size + 7)
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

    loop do
      prompt "Choose a square (#{remaining_squares}):"
      square = gets.chomp.upcase
      if square.start_with? 'H'
        display_help
        next
      end
      break if board.unmarked_keys.include?(square.to_i)
      prompt "Sorry, that's not a valid choice."
    end

    board[square.to_i] = human.marker
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

  def computer_moves_offensive # recognize 2 squares marked by self
    square = winning_square_num(computer)
    board[square] = computer.marker
  end

  def computer_can_defend?
    player_has_two_squares?(human)
  end

  def computer_moves_defensively # recognize 2 squares marked by opponent
    square = winning_square_num(human)
    board[square] = computer.marker
  end

  def player_has_two_squares?(player)
    winning_square_num(player).class == Integer
  end

  def winning_square_num(player)
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line).map(&:marker)
      if squares.count(player.marker) == 2 && squares.count(Square::INITIAL_MARKER) == 1
        return select_empty_square(line)
      end
    end
  end

  def select_empty_square(squares)
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
      prompt "Would you like to play again? (Y / N)"
      answer = gets.chomp.upcase
      break if %(Y N).include? answer[0]
      prompt "Sorry, I didn't understand that.  Can you rephrase that?"
    end

    answer.start_with? 'Y'
  end

  def display_play_again_message
    prompt "Okay.  Let's play again!"
    sleep 1
  end

  def reset
    board.reset
    self.current_player = first_to_play
  end

  def display_goodbye_message
    prompt "Thanks for playing!  Goodbye!"
  end
end

game = TTTGame.new
game.play
