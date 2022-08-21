module Formatable_Display
  # HELP_BOARD = Board.new.set_help_board

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

  def clear_screen_and_display(gameboard, scoreboard)
    clear
    display_help_option
    puts horizontal_line(names_length)
    puts scoreboard
    puts
    puts horizontal_line(names_length)
    puts
    puts gameboard
    puts
  end

  def display_help_option
    puts "Press (H) for help identifying the square #."
  end

  # def display_scoreboard
  #   puts horizontal_line
  #   puts scoreboard
  #   puts
  #   puts horizontal_line
  #   puts
  # end

  def horizontal_line(names_length) # corrects for long names
    '-' * [50, names_length].max
  end

    def display_play_again_message
    prompt "Okay.  Let's play again!"
    sleep 1
  end

  def display_goodbye_message
    prompt "Thanks for playing!  Goodbye!"
  end
end

class Gameboard
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
  def to_s
    "              |     |\n\
           #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}\n\
              |     |\n\
         -----------------\n\
              |     |\n\
           #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}\n\
              |     |\n\
         -----------------\n\
              |     |\n\
           #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}\n\
              |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def all_markers_match?(squares)
    squares.map(&:marker).uniq.size == 1
  end

  def set_help_board
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

class Scoreboard
  include Displayable
  attr_accessor :score, :human, :computer

  def initialize(human, computer)
    @human = human
    @computer = computer
    @score = { human => 0, computer => 0 }
  end

  def to_s
    "\n          #{human.name}       #{computer.name}\n\n\
#{horizontal_line(names_length)}\n\n\
  Score:   #{score[human]}#{name_padding}#{score[computer]}\n\n\
  Marker:  #{human.marker}#{name_padding}#{computer.marker}\n"
  end

  private

  def name_padding # corrects for long names
    ' ' * (human.name.size + 7)
  end
end

class Player
  include Displayable
  attr_accessor :name, :marker

  private

  def has_two_squares?
    winning_square_num.class == Integer
  end

  def winning_square_num
    Gameboard::WINNING_LINES.each do |line|
      squares = gameboard.squares.values_at(*line).map(&:marker)

      if squares.count(self.marker) == 2 &&
         squares.count(Square::INITIAL_MARKER) == 1
        return select_empty_square(line)
      end
    end
  end

  def select_empty_square(squares)
    squares.select { |square| gameboard.squares[square].unmarked? }.first
  end
end

class Human < Player
  include Displayable

  def set_name
    loop do
      clear_and_new_line
      prompt "Please enter your name:"
      self.name = gets.chomp.capitalize
      break unless self.name.empty? || name.chars.all? { |char| char == ' ' } # test
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

  # # rubocop:disable Metrics/MethodLength
  # def moves(board)
  #   choice = nil # converts to 0 when no value is recieved

  #   loop do
  #     choice = picks_square(board)
  #     if choice.start_with? 'H'
  #       # display_help # dependency required TTTGame::display_help
  #       TTTGame::(board)
  #       next
  #     end
  #     break if board.unmarked_keys.include? choice.to_i # dependency required
  #     prompt "Sorry, that's not a valid choice."
  #     pause
  #   end

  #   self.marks_square(board, choice) # not an instance variable
  # end
  # # rubocop:enable Metrics/MethodLength

  def picks_square(gameboard, scoreboard)
    display_available_square_choices(gameboard, scoreboard)
    gets.chomp.upcase
  end

  private

  def display_available_square_choices(gameboard, scoreboard)
    clear_screen_and_display(gameboard, scoreboard) # needs Formatable_Display
    prompt "Choose a square (#{remaining_squares(gameboard)}):"
  end

  def remaining_squares(gameboard)
    squares = gameboard.unmarked_keys # dependency required

    if squares.size > 2
      "#{squares[0...-1].join(', ')} or #{squares.last}"
    else
      squares.join(' or ')
    end
  end

  def marks_square(gameboard, choice)
    gameboard[choice.to_i] = self.marker # dependency required
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

  def can_win?
    self.has_two_squares?
  end

  def moves_offensively # recognize 2 squares marked by self
    square = winning_square_num
    gameboard[square] = self.marker
  end

  def can_defend?(opponent)
    opponent.has_two_squares?
  end

  def moves_defensively(opponent) # recognize 2 squares marked by opponent
    square = opponent.winning_square_num
    gameboard[square] = self.marker
  end

end

class TTTGame
  include Displayable
  HELP_BOARD = Gameboard.new.set_help_board

  attr_accessor :current_player, :scoreboard, :first_to_play
  attr_reader :gameboard, :human, :computer

  def initialize
    @gameboard = Gameboard.new
    @human = Human.new
    @computer = Computer.new
    @scoreboard = Scoreboard.new(human, computer)
    @first_to_play = nil
  end

  def play
    display_greeting_message
    setup_game
    play_game
    display_goodbye_message
  end

  def names_length
    human.name.size + computer.name.size + 20
  end

  private

  def setup_game
    setup_names
    setup_markers
    setup_who_starts
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

  def play_game
    loop do
      players_move
      add_point_to_winner
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  # def clear_screen_and_display
  #   clear
  #   display_help_option
  #   display_scoreboard
  #   board.draw
  #   puts
  # end

  # def display_help_option
  #   puts "Press (H) for help identifying the square #."
  # end

  # def display_scoreboard
  #   puts horizontal_line
  #   puts scoreboard
  #   puts
  #   puts horizontal_line
  #   puts
  # end

  def display_help # helps user identify square numbers
    clear
    puts
    scoreboard.display
    HELP_BOARD.draw
    puts
    puts "          Press (Enter) to begin."
    gets
    clear_screen_and_display(gameboard, scoreboard)
  end

  # def horizontal_line # corrects for long names
  #   names_length = human.name.size + computer.name.size + 20

  #   '-' * [50, names_length].max
  # end

#   def scoreboard
#     "\n          #{human.name}       #{computer.name}\n\n\
# #{horizontal_line}\n\n\
#   Score:   #{score[human]}#{name_padding}#{score[computer]}\n\n\
#   Marker:  #{human.marker}#{name_padding}#{computer.marker}\n"
#   end

  # def name_padding # corrects for long names
  #   ' ' * (human.name.size + 7)
  # end

  def players_move
    loop do
      clear_screen_and_display(gameboard, scoreboard)
      current_player_moves
      break if gameboard.someone_won? || gameboard.full?
    end
  end

  def current_player_moves
    if current_player == human
      human_moves
      self.current_player = computer
    else
      computer_moves_against(human)
      self.current_player = human
    end
  end

  # # rubocop:disable Metrics/MethodLength
  # # def moves(board)
  #   choice = nil # converts to 0 when no value is recieved

  #   loop do
  #     choice = picks_square(board)
  #     if choice.start_with? 'H'
  #       # display_help # dependency required TTTGame::display_help
  #       TTTGame::(board)
  #       next
  #     end
  #     break if board.unmarked_keys.include? choice.to_i # dependency required
  #     prompt "Sorry, that's not a valid choice."
  #     pause
  #   end

  #   self.marks_square(board, choice) # not an instance variable
  # end
  # # rubocop:enable Metrics/MethodLength
  # rubocop:disable Metrics/MethodLength
  def human_moves
    choice = nil # converts to 0 when no value is recieved

    loop do
      choice = human.picks_square(gameboard, scoreboard)
      if choice.start_with? 'H'
        display_help
        next
      end
      break if gameboard.unmarked_keys.include? choice.to_i
      prompt "Sorry, that's not a valid choice."
      pause
    end

    human.marks_square(gameboard, choice) # not an instance variable
  end
  # rubocop:enable Metrics/MethodLength

  # def moves_against(opponent, board)
  #   clear_screen_and_display(board)
  #   if self.can_win?
  #     self.moves_offensively
  #   elsif self.can_defend?(opponent)
  #     self.moves_defensively(opponent)
  #   else
  #     board[board.unmarked_keys.sample] = self.marker # depenency required
  #   end
  # end

  def computer_moves_against(opponent)
    clear_screen_and_display(gameboard, scoreboard)
    if computer.can_win?
      computer.moves_offensively
    elsif computer.can_defend?(opponent)
      computer.moves_defensively(opponent)
    else
      gameboard[gameboard.unmarked_keys.sample] = computer.marker
    end
  end

  def add_point_to_winner
    winner = case gameboard.winning_marker
             when human.marker    then human
             when computer.marker then computer
             end
    scoreboard[winner] += 1 if winner
  end

  def display_result
    clear_screen_and_display(gameboard, scoreboard)
    prompt case gameboard.winning_marker
           when human.marker    then "You win!"
           when computer.marker then "The computer has won!"
           else                      "It's a tie."
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

  def reset
    gameboard.reset
    self.current_player = first_to_play
  end
end

game = TTTGame.new
game.play
