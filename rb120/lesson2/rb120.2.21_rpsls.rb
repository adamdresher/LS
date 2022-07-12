class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    loop do
      puts "What's your name?"
      self.name = gets.chomp.capitalize
      break unless name.empty?
      puts "Sorry, please give a name."
    end
  end

  def choose_move
    choice = nil
    loop do
      puts
      puts "Choose a move: Rock, Paper, or Scissors"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Sorry, wrong choice."
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
  attr_accessor :human, :computer, :single_or_set, :score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = { self.human => 0, self.computer => 0 }
    @single_or_set = nil
  end

  def display_welcome_message
    puts
    prompt "Hello #{human.name}.  Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    prompt "Thanks for playing Rock, Paper, Scissors!"
  end

  def clear_screen
    system('clear')
  end

  def prompt(msg)
    puts "=> #{msg}"
  end

  def choose_single_or_set
    loop do
      prompt "Choose your gameplay:"
      puts "     A single match     (1)\n     First to 10 points (2)"
      @single_or_set = gets.chomp.to_i
      break if [1, 2].include? single_or_set
      prompt "Sorry, please choose option 1 or 2."
    end
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
    prompt (match_winner ? "#{match_winner.name} wins the match!" : "It's a tie!")
  end

  def display_game_winner
    prompt "#{score.key(10).name} wins the game!"
  end

  def play_again?
    answer = nil
    loop do
      prompt "Do you want to play again? (yes/no)"
      answer = gets.chomp.downcase
      break if answer[0] == 'y' || answer[0] == 'n'
      prompt "Sorry, let's stick with 'yes' or 'no'."
    end
    answer.start_with? 'y'
  end

  def play
    clear_screen
    display_welcome_message
    loop do
      choose_single_or_set
      if single_or_set == 1
        play_match
      else
        play_set
      end
      display_game_winner unless single_or_set == 1
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSgame.new.play
