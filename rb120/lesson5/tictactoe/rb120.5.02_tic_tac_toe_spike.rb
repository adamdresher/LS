class Board
  INITIAL_MARKER = ' '

  def initialize
    @squares = {}
    (1..9).each { |num| @squares[num] = Square.new(INITIAL_MARKER) }
  end

  def get_square_at(key)
    @squares[key]
  end
end

class Square
  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end

class Player
  def initialize
  end

  def mark
  end
end

class TTTGame
  attr_reader :board

  def initialize
    @board = Board.new
    @user = Player.new
    @computer = Player.new
  end

  def display_greeting
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye
    puts "Thanks for playing!  Goodbye!"
  end

  def setup_board
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

  # def chooses_move
  #   if self == user
  #     user.chooses_move
  #   else
  #     computer.chooses_move
  #   end
  # end

  # def user_chooses_move
  #   puts "Choose a square between 1-9:"
  #   loop do
  #   end
  # end

  def play
    display_greeting
    loop do
      setup_board # display_board
      break
      # loop do
      #   a_player_chooses_a_move
      #   break if someone_won? || board_full?
      # end
      display_winner # display_result
      play_again?
    end
    display_goodbye
  end

  # private

  # def a_player_chooses_a_move
  #   board_has_even_num_of_moves ? user.chooses_move : computer.chooses_move
  # end
end

game = TTTGame.new
game.play
