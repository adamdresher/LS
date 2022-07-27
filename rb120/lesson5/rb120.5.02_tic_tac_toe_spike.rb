class Board
  def initialize
  end
end

class Square
  def initialize
  end
end

class Player
  def initialize
  end

  def mark
  end
end

class TTTGame
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
    puts "     |     |"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "     |     |"
    puts "     |     |"
    puts "-----------------"
    puts "     |     |"
    puts "     |     |"
    puts "     |     |"
    puts
  end

  def play
    display_greeting
    loop do
      setup_board # display_board
      break
      loop do
        a_player_chooses_a_move
        break if someone_won? || board_full?
      end
      display_winner # display_result
      play_again?
    end
    display_goodbye
  end

  private

  def a_player_chooses_a_move
    board_has_even_num_of_moves ? user.chooses_move : computer.chooses_move
  end
end

game = TTTGame.new
game.play
