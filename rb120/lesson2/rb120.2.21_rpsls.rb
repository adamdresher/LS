module Viewable
  def clear_screen
    system('clear')
  end

  def prompt(msg)
    puts "=> #{msg}"
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value.downcase == 'spock' ? value.capitalize : value
  end

  def to_s
    @value
  end

  def >(other_move)
    (scissors? && other_move.paper?) ||
      (paper? && other_move.rock?) ||
      (rock? && other_move.lizard?) ||
      (lizard? && other_move.spock?) ||
      (spock? && other_move.scissors?) ||
      (scissors? && other_move.lizard?) ||
      (lizard? && other_move.paper?) ||
      (paper? && other_move.spock?) ||
      (spock? && other_move.rock?) ||
      (rock? && other_move.scissors?)
  end

  def <(other_move)
    (paper? && other_move.scissors?) ||
      (rock? && other_move.paper?) ||
      (lizard? && other_move.rock?) ||
      (spock? && other_move.lizard?) ||
      (scissors? && other_move.spock?) ||
      (lizard? && other_move.scissors?) ||
      (paper? && other_move.lizard?) ||
      (spock? && other_move.paper?) ||
      (rock? && other_move.spock?) ||
      (scissors? && other_move.rock?)
  end

  protected

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'Spock'
  end
end

class Player
  include Viewable

  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    loop do
      clear_screen
      puts
      prompt "What's your name?"
      self.name = gets.chomp.capitalize
      break unless name.empty?
      prompt "Sorry, please give a name."
    end
  end

  def choose_move
    choice = nil
    loop do
      puts
      prompt "Choose a move: Rock, Paper, Scissors, Lizard, or Spock"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      prompt "Sorry, wrong choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Bishop', 'Bender', 'Data', 'Roy Batty'].sample
  end

  def choose_move
    self.move = Move.new(Move::VALUES.sample)
  end
end

# game engine
class RPSgame
  include Viewable

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = { self.human => 0, self.computer => 0 }
    @single_or_set = nil
  end

  def play
    clear_screen
    display_welcome_message
    loop do
      choose_single_or_set
      single_or_set == 1 ? play_match : play_set
      display_game_winner unless single_or_set == 1
      break unless play_again?
      clear_screen
    end
    display_goodbye_message
  end

  private

  attr_accessor :human, :computer, :single_or_set, :score

  def display_welcome_message
    puts
    prompt "Hello #{human.name}.  \
Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    prompt "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!\n\
   Goodbye"
  end

  def choose_single_or_set
    loop do
      puts
      prompt "Menu:"
      puts "     Play a single match     (1)\
      \n     Play first to 10 points (2)\
      \n     How to play RPSLS       (H)"
      self.single_or_set = gets.chomp.downcase
      if self.single_or_set == 'h'
        display_instructions
        clear_screen
        next
      end
      break if [1, 2].include? (self.single_or_set = single_or_set.to_i)
      prompt "Sorry, please choose option 1 or 2."
      sleep(1)
      clear_screen
    end
  end

  def display_instructions
    clear_screen
    puts
    prompt "How to play Rock, Paper, Scissors, Lizard, Spock:

   Rock, Paper, Scissors, Lizard, Spock (RPSLS) is very similar to 
   the traditional Rock, Paper, Scissors - there are just a couple 
   more options.

   Below is a breakdown of what wins against what:

     Scissors cuts paper
     Paper covers rock
     Rock crushes lizard
     Lizard poisons Spock
     Spock smashes scissors
     Scissors decapitates lizard
     Lizard eats paper
     Paper disproves Spock
     Spock vaporizes rock
     Rock crushes scissors"
    gets
  end

  def play_match
    clear_screen
    human.choose_move
    computer.choose_move
    display_moves
    display_match_winner
  end

  def play_set
    loop do
      play_match
      score[match_winner] += 1 if match_winner # `+`, noMethodError for NilClass
      display_score
      break if game_winner
      sleep(2)
    end
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_score
    puts
    prompt "#{human.name} has #{score[human]} points."
    prompt "#{computer.name} has #{score[computer]} points."
  end

  def match_winner
    if human.move > computer.move
      self.human
    elsif human.move < computer.move
      self.computer
    else
      nil
    end
  end

  def game_winner
    score.any? { |_, v| v >= 10 }
  end

  def display_match_winner
    puts
    prompt (match_winner ? "#{match_winner.name} wins the match!" : "It's a tie!")
  end

  def display_game_winner
    puts
    prompt "#{score.key(10).name} wins the game!"
  end

  def play_again?
    answer = nil
    loop do
      puts
      prompt "Do you want to play again? (yes/no)"
      answer = gets.chomp.downcase
      break if answer[0] == 'y' || answer[0] == 'n'
      prompt "Sorry, let's stick with 'yes' or 'no'."
    end
    answer.start_with? 'y'
  end
end

RPSgame.new.play
