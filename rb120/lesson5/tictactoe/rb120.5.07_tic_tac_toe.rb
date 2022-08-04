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
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_PLAY = HUMAN_MARKER # resolving human_moves_next?

  attr_accessor :current_player, :score
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = human
    # @human_score = 0
    # @computer_score = 0
    @score = { human => 0, computer => 0 }
  end

  def play
    display_greeting_message
    gets
    play_game
    display_goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def display_greeting_message
    clear
    puts "\n\n\n\n\n\n"
    puts "          Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing!  Goodbye!"
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
    "\n          You       Computer\n\n\
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

  def remaining_squares
    squares = board.unmarked_keys

    if squares.size > 2
      "#{squares[0...-1].join(', ')} or #{squares.last.to_s}"
    else
      squares.join(' or ')
    end
  end

  def players_move
    loop do
      current_player_moves
      clear_screen_and_display_board
      break if board.someone_won? || board.full?
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

  # design choices for lines 198 - 252 should be reconsidered
  def computer_moves
    # board[board.unmarked_keys.sample] = computer.marker

    if computer_can_win?
      computer.moves_offensively
    elsif computer_can_defend?
      computer.moves_defensively
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def computer_can_defend? # not functioning correctly
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line)
      if squares.count(HUMAN_MARKER) == 2 && squares.count(COMPUTER_MARKER) == 1
        return true
      end
    end
    false
  end

  # computer ai: defense
  # recognize 2 squares marked by opponent and defend
  def moves_defensively # not functioning correctly
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line)
      if squares.count(HUMAN_MARKER) == 2 && squares.count(COMPUTER_MARKER) == 1
        square = select_empty_square(line)
        board[square] = computer.marker
      end
    end
  end

  def computer_can_win? # not functioning correctly
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line)
      if squares.count(COMPUTER_MARKER) == 2 && squares.count(HUMAN_MARKER) == 1
        return true
      end
    end
    false
  end

  # computer ai: offense
  # recognize 2 squares marked by self and attack
  def moves_offensively # not functioning correctly
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line)
      if squares.count(COMPUTER_MARKER) == 2 && squares.count(HUMAN_MARKER) == 1
        square = select_empty_square(line)
        board[square] = computer.marker
      end
    end
  end

  def select_empty_square(squares)
    squares.min
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

  def add_point_to_winner
    winner = (board.winning_marker == HUMAN_MARKER) ? human : computer
    score[winner] += 1
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
    self.current_player = human
  end
end

game = TTTGame.new
game.play
