class Player
  attr_accessor :move, :name

  def initialize(player_type=:human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      loop do
        puts "What's your name?"
        self.name = gets.chomp.capitalize
        break unless name.empty?
        puts "Sorry, please give a name."
      end
    else
      self.name = ['R2D2', 'Bishop', 'Bender', 'Data', 'Roy Batty'].sample
    end
  end

  def choose_move
    if human?
      loop do
        puts "Choose a move: Rock, Paper, or Scissors"
        self.move = gets.chomp.downcase
        break if ['rock', 'paper', 'scissors'].include? move
        puts "Sorry, wrong choice."
      end
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

 class RPSgame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts
    puts "Hello #{human.name}.  Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} wins!" if computer.move == 'scissors'
      puts "#{computer.name} wins!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} wins!" if computer.move == 'rock'
      puts "#{computer.name} wins!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} wins!" if computer.move == 'paper'
      puts "#{computer.name} wins!" if computer.move == 'rock'
    else
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

  def play
    display_welcome_message
    loop do
      human.choose_move
      computer.choose_move
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSgame.new.play
