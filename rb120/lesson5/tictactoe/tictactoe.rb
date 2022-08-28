require 'pry'
require 'pry-byebug'

# greeting is not formatted to 80 char center

module Formatable_Display
  def clear
    system 'clear'
  end

  def clear_and_new_line
    clear
    puts
  end

  def pause
    sleep 0.7
  end

  def prompt(msg)
    puts "=> #{msg}"
  end
end

module Displayable
  include Formatable_Display

  def display_greeting_message
    clear
    puts "\n\n\n\n\n\n"
    puts "          Welcome to Tic Tac Toe!"
    puts
    puts
    puts "          Press (Enter) to begin."
    gets
  end

  def display_first_player_choices(human, computer)
    clear_and_new_line
    prompt "Thanks #{human.name}.  Now let's figure out who starts."
    puts "     Press (1) to start."
    puts "     Press (2) to let the #{computer.name} start."
    puts "     Press (3) to leave it up to chance."
  end

  def clear_screen_and_display(game)
    clear
    display_help_option
    boards = [game.board, game.score.board]

    boards.each do |board|
      puts horizontal_line(*game.score.counter.keys) # scoreboard knows players
      puts
      puts board # converts the board arrays to a string first
      puts
    end
  end

  def display_help_option
    puts "Press (H) for help identifying the square #."
  end

  def horizontal_line(*players) # corrects for long names; accepts array args
    '-' * line_length(players)
  end

  def line_length(players)
    names_length = players.map { |player| player.name.size }.sum + 20
    [80, names_length].max
  end

  def display_play_again_message
    prompt "Okay.  Let's play again!"
    sleep 1
  end

  def display_goodbye_message
    prompt "Thanks for playing!  Goodbye!"
  end
end

# class Game
#   attr_accessor :board, :score

#   def initialize(*players)
#     @board = Gameboard.new(players)
#     @score = Scoreboard.new(players)
#   end
# end

# class Gameboard
#   include Displayable
#   WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
#                    [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
#                    [1, 5, 9], [3, 5, 7]]            # diagonals

#   attr_reader :squares
#   attr_accessor :board

#   def initialize(players)
#     @squares = {}
#     reset
#     @board = generate_new
#     format_display_for players
#   end
class Gameboard
  include Displayable
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                   [1, 5, 9], [3, 5, 7]]            # diagonals

  attr_reader :squares, :players
  attr_accessor :board, :score

  def initialize(*players)
    @players = players
    @squares = {}
    reset
    @board = generate_display
    format_display
    @score = Scoreboard.new(players)
  end

  def board
    generate_display
    format_display
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def full?
    unmarked_keys.empty?
  end

  def unmarked_keys
    @squares.keys.select { |square| @squares[square].unmarked? }
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

  def set_helper_nums
    (1..9).each { |num| @squares[num] = num }
    self
  end

  def remaining_squares
    squares = unmarked_keys

    if squares.size > 2
      "#{squares[0...-1].join(', ')} or #{squares.last}"
    else
      squares.join(' or ')
    end
  end

  private

  def format_display
    @board.map! { |line| line.center(line_length(players)) }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def generate_display
      @board = ["     |     |     ",
                "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  ",
                "     |     |     ",
                "-----------------",
                "     |     |     ",
                "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  ",
                "     |     |     ",
                "-----------------",
                "     |     |     ",
                "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  ",
                "     |     |     "]
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

class Scoreboard
  include Displayable
  attr_reader :players
  attr_accessor :counter, :board

  def initialize(players)
    @counter = Hash.new()
    @players = players
    start_recording
    generate_board
    format_board
  end

  def to_s
    @board
  end

  def board
    generate_board
    format_board
  end

  def add_point_to(winner)
    counter[winner] += 1 if winner
  end

  private

  def start_recording
    players.each { |player| @counter[player] = 0 }
  end

  def format_board # centers score to gameboard; min width of 80 char
    @board.map! do |line|
                  line.center(line_length(counter.keys) - 9)
                end # to_s
  end

  def generate_board
    human, computer = players
    name_padding = 8 + computer.name.size # counterbalance computer name length

    @board = ["#{' ' * name_padding}#{human.name}       #{computer.name}",
              "#{horizontal_line(human, computer)}",
              "Score:   #{counter[human]}#{name_buffer}#{counter[computer]}",
              "Marker:  #{human.marker}#{name_buffer}#{computer.marker}"]
  end

  def name_buffer # corrects for long names
    ' ' * (counter.keys[0].name.size + 6)
  end
end

class Player
  attr_accessor :name, :marker

  def has_two_squares?(game)
    locate_winning_square_num(game).class == Integer
  end

  def locate_winning_square_num(game)
    Gameboard::WINNING_LINES.each do |line|
      squares = game.squares.values_at(*line).map(&:marker)

      if squares.count(marker) == 2 &&
         squares.count(Square::INITIAL_MARKER) == 1
        return select_empty_square(game, line)
      end
    end
  end

  private

  def select_empty_square(game, squares)
    squares.select { |square| game.squares[square].unmarked? }.first
  end
end

class Human < Player
  include Displayable

  def set_name
    loop do
      clear_and_new_line
      prompt "Please enter your name:"
      self.name = gets.strip.capitalize
      break unless name.empty? || name.chars.all? { |char| char == ' ' }
      prompt "Sorry, that's an invalid entry."
      pause
    end
  end

  def set_marker(opponent)
    loop do
      clear_and_new_line
      prompt "Thanks #{self.name}.  You'll be playing with #{opponent.name}."
      prompt "Which marker would you like to play as?  (X or O)"
      user_marker = gets.chomp.upcase
      self.marker = user_marker
      break if ['X', 'O'].include? user_marker
      prompt "Sorry, that's not a marker.  Please try again."
      pause
    end
  end

  def marks_square(game, choice)
    game[choice.to_i] = self.marker
  end
end

class Computer < Player
  COMPUTER_NAMES = ['Bender', 'Bishop', 'Data', 'R2D2', 'Roy Batty']

  def set_name
    self.name = COMPUTER_NAMES.sample
  end

  def set_marker(opponent)
    options = ['X', 'O']
    self.marker = options.reject { |option| option == opponent.marker }.first
  end

  def can_win?(game)
    has_two_squares?(game)
  end

  def moves_offensively(game) # recognize 2 squares marked by self
    square = locate_winning_square_num(game)
    game[square] = marker
  end

  def can_defend?(game, opponent)
    opponent.has_two_squares?(game)
  end

  def moves_defensively(game, opponent) # recognize 2 squares marked by opponent
    square = opponent.locate_winning_square_num(game)
    game[square] = self.marker
  end
end

class TTTGame
  include Displayable
  attr_accessor :game, :first_to_play, :current_player
  attr_reader :human, :computer
  @@help_id = nil # identify square numbers for user
  @@names_length = nil

  def initialize
    @human = Human.new
    @computer = Computer.new
    @first_to_play = nil
  end

  def play
    display_greeting_message
    setup_game
    play_game
    display_goodbye_message
  end

  private

  def setup_game
    setup_names
    setup_markers
    setup_who_starts
    setup_gameboard_scoreboard_helpboard
  end

  def setup_names
    human.set_name
    computer.set_name
  end

  def setup_markers
    human.set_marker(computer)
    computer.set_marker(human)
  end

  def setup_who_starts
    choice = decide_who_starts

    self.first_to_play = case choice
                         when '1' then human
                         when '2' then computer
                         when '3' then [human, computer].sample
                         end
    self.current_player = first_to_play
  end

  def decide_who_starts
    choice = nil

    loop do
      display_first_player_choices(human, computer)
      choice = gets.chomp
      break if !choice.empty? && %(1 2 3).include?(choice)
      prompt "Sorry, that's an invalid choice.  Please try again."
      pause
    end

    choice
  end

  def setup_gameboard_scoreboard_helpboard # collaborators required first
    binding.pry
    @@names_length = human.name.size + computer.name.size
    @game = Gameboard.new(human, computer)
    @@help_id = Gameboard.new(human, computer).set_helper_nums
  end

  def play_game
    loop do
      players_move
      game.score.add_point_to winner
      display_result
      break unless play_again?
      reset_board
      display_play_again_message
    end
  end

  def players_move
    loop do
      clear_screen_and_display game
      current_player_moves
      break if game.someone_won? || game.full?
    end
  end

  def current_player_moves
    if current_player == human
      human_moves
      self.current_player = computer
    else
      computer_moves_against human
      self.current_player = human
    end
  end

  def human_moves
    choice = nil # converts to 0 when no value is recieved

    loop do
      clear_screen_and_display game
      display_available_square_choices
      choice = gets.chomp.upcase
      if choice.start_with? 'H'
        display_help
        next
      end
      break if game.unmarked_keys.include? choice.to_i
      prompt "Sorry, that's not a valid choice."
      pause
    end
    human.marks_square(game, choice)
  end

  def display_available_square_choices
    prompt "Choose a square (#{game.remaining_squares}):"
  end

  def display_help # helps user identify square numbers
    clear
    puts
    boards = [@@help_id.board, game.score.board]

    boards.each do |board|
      puts horizontal_line(human, computer)
      puts
      puts board
      puts
    end

    puts "Press (Enter) to begin.     ".center(line_length([human, computer]))
    gets
    clear_screen_and_display game
  end

  def computer_moves_against(opponent)
    clear_screen_and_display game
    if computer.can_win? game
      computer.moves_offensively(game)
    elsif computer.can_defend?(game, opponent)
      computer.moves_defensively(game, opponent)
    else
      game[game.unmarked_keys.sample] = computer.marker
    end
  end

  def winner
    case game.winning_marker
    when human.marker    then human
    when computer.marker then computer
    end
  end

  def display_result
    clear_screen_and_display game
    prompt case winner
           when human    then "You win!"
           when computer then "The computer has won!"
           else               "It's a tie."
           end
  end

  def play_again?
    answer = nil

    loop do
      prompt "Would you like to play again? (Y / N)"
      answer = gets.chomp.upcase
      break if !answer.empty? && %(Y N).include?(answer[0])
      prompt "Sorry, I didn't understand that.  Can you rephrase that?"
      pause
      display_result
    end

    answer.start_with? 'Y'
  end

  def reset_board
    game.reset
    self.current_player = first_to_play
  end
end

game = TTTGame.new
game.play
