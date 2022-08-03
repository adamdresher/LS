class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5 ,8], [3, 6, 9], # columns
                   [1, 5, 9], [3, 5, 7]]            # diagonals

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

      if !squares.first.unmarked? && all_same_marker?(squares)
      # if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |num| @squares[num] = Square.new }
  end

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  def all_same_marker?(squares)
    squares.map(&:marker).uniq.size == 1
  end

  # def three_identical_markers?(squares)
  #   markers = squares.reject(&:unmarked?).map(&:marker)
  #   return false if markers.size != 3
  #   markers.min == markers.max
  # end
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

  attr_accessor :current_player
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = human
  end

  def play
    display_greeting_message

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        # clear_screen_and_display_board if human_moves_next? # legible, but difficult to change first player without diving deeper checking for dependent methods
        clear_screen_and_display_board
      end

      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def display_greeting_message
    clear
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing!  Goodbye!"
  end

  def display_board
    puts "You're #{human.marker}.  Computer is #{computer.marker}."
    puts
    board.draw
    puts
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    clear_screen_and_display_board
    puts case board.winning_marker
         when human.marker    then "You win!"
         when computer.marker then "The computer has won!"
         else                      "It's a tie."
         end
  end

  def human_moves
    square = nil
    puts "Choose a square (#{board.unmarked_keys.join(', ')}):"

    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
    # @human.mark(square) # another valid approach
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    # human_moves_next? ? human_moves : computer_moves # resolving FIRST_TO_PLAY
    if current_player == human
      human_moves
      self.current_player = computer
    else
      computer_moves
      self.current_player = human
    end
  end

  # def human_moves_next? # legible, however not quite ideal if the first player is ever to be changed
  #   board.unmarked_keys.size.odd?
  # end

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
    clear
    current_player = human
  end

  def display_play_again_message
    puts "Okay.  Let's play again!"
    puts
  end
end

game = TTTGame.new
game.play
