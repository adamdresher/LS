require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                   [1, 4, 7], [2, 5 ,8], [3, 6, 9], # columns
                   [1, 5, 9], [3, 5, 7]]            # diagonals

  def initialize
    @squares = {}
    reset
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |square| @squares[square].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  end

  def detect_winner # returns winning marker or nil
    WINNING_LINES.each do |line|
      # basic logic
      # if @squares[line[0]].marker == TTTGame::HUMAN_MARKER &&
      #    @squares[line[1]].marker == TTTGame::HUMAN_MARKER &&
      #    @squares[line[2]].marker == TTTGame::HUMAN_MARKER
      #   return TTTGame::HUMAN_MARKER
      # elsif @squares[line[0]].marker == TTTGame::COMPUTER_MARKER &&
      #       @squares[line[1]].marker == TTTGame::COMPUTER_MARKER &&
      #       @squares[line[2]].marker == TTTGame::COMPUTER_MARKER
      #   return TTTGame::COMPUTER_MARKER
      # end
      # one way to refactor
      # if (0..2).all? { |square| @squares[line[square]].marker == TTTGame::HUMAN_MARKER }
      #   return TTTGame::HUMAN_MARKER
      # elsif (0..2).all? { |square| @squares[line[square]].marker == TTTGame::COMPUTER_MARKER }
      #   return TTTGame::COMPUTER_MARKER
      # end
      # another way to refactor
      if count_human_marker(@squares.values_at(*line)) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def reset
    (1..9).each { |num| @squares[num] = Square.new }
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

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_greeting
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye
    puts "Thanks for playing!  Goodbye!"
  end

  def display_board(clear_screen = true)
    system 'clear' if clear_screen
    puts "You're #{human.marker}.  Computer is #{computer.marker}."
    puts
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts
  end

  def display_result
    display_board
    puts case board.detect_winner
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

    board.set_square_at(square, human.marker)
    # @human.mark(square) # another valid approach
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
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

  def play
    system 'clear'
    display_greeting

    loop do
      display_board(false)
      loop do
        human_moves
        break if board.someone_won? || board.full?
        computer_moves
        break if board.someone_won? || board.full?
        display_board
      end
      display_result
      break unless play_again?
      board.reset
      system 'clear'
      puts "Okay.  Let's play again!"
      puts
    end

    display_goodbye
  end
end

game = TTTGame.new
game.play
