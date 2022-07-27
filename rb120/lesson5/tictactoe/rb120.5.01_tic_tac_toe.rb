=begin
Description:

Tic Tac Toe is a 2 person game played on a 3x3 grid board.  Players take turns
marking a square.  The first person to mark 3 squares in a row wins.

Nouns: board, player, square, grid
Verbs: play, mark, win

Initial structure:

Board
Square
Player
- mark
- play

Spike (code exploration):
=end

class Board
  def initialize
    # we need some way to model the 3x3 grid.  'squares'?
    # what data structure should we use?
    # - array/hash of Square objects?
    # - array/hash of strings or integers?
  end
end

class Square
  def initialize
    # maybe a 'status' to keep track of this square's mark?
  end
end

class Player
  def initialize
    # maybe a 'marker' to keep track of this player's symbol (ie, 'x' or 'o')
  end

  def mark
  end

  def play
  end
end

# game orchestration
class TTTGame
  def play
    display_greeting
    loop do
      setup_board
      loop do
        a_player_chooses_a_move
        break if someone_won? || board_full?
      end
      display_winner
      play_again?
    end
    goodbye
  end

  private

  def a_player_chooses_a_move
    board_has_even_num_of_moves ? user.chooses_move : computer.chooses_move
  end
end

# public interface
game = TTTGame.new
game.play
