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
  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      human.choose_move
      computer.choose_move
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  attr_accessor :human, :computer

  def display_welcome_message
    puts
    puts "Hello #{human.name}.  Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} wins!"
    elsif human.move < computer.move
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Do you want to play again? (yes/no)"
      answer = gets.chomp.downcase
      break if answer[0] == 'y' || answer[0] == 'n'
      puts "Sorry, let's stick with 'yes' or 'no'."
    end
    answer.start_with? 'y'
  end
end

RPSgame.new.play
