require 'yaml'
MESSAGES = YAML.load_file('rb120.2.21_rpsls.yml')

module Viewable
  def clear_screen
    system('clear')
  end

  def prompt(msg)
    puts "=> #{msg}"
  end

  def prompt_yml(msg)
    puts "=> #{MESSAGES[msg]}"
  end

  def prompt_yml2(msg)
    puts MESSAGES[msg]
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
      prompt_yml 'get_name'
      self.name = gets.chomp.capitalize
      break unless name.empty?
      prompt_yml 'get_name2'
    end
  end

  def choose_move
    choice = nil
    loop do
      puts
      prompt_yml 'choose_move'
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      prompt_yml 'choose_move2'
      sleep 0.5
      clear_screen
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
    @score = { human => 0, computer => 0 }
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
    prompt_yml 'goodbye'
  end

  def choose_single_or_set
    loop do
      display_menu
      self.single_or_set = gets.chomp.downcase
      if single_or_set == 'h'
        display_instructions
        next
      end
      break if [1, 2].include?(self.single_or_set = single_or_set.to_i)
      display_menu_try_again
    end
  end

  def display_menu
    puts
    prompt_yml 'menu'
    prompt_yml2 'menu2'
  end

  def display_menu_try_again
    prompt_yml 'menu3'
    sleep 1
    clear_screen
  end

  def display_instructions
    clear_screen
    puts
    prompt_yml 'instructions'
    prompt_yml2 'press_enter'
    gets
    clear_screen
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
      score[match_winner] += 1 if match_winner
      display_score
      break if game_winner
      prompt_yml2 'press_enter'
      gets
    end
  end

  def display_moves
    puts
    prompt "#{human.name} chose #{human.move}"
    prompt "#{computer.name} chose #{computer.move}"
  end

  def display_score
    puts
    prompt "#{human.name} has #{score[human]} #{format_points(human)}"
    prompt "#{computer.name} has #{score[computer]} #{format_points(computer)}"
  end

  def format_points(player)
    score[player] == 1 ? 'point' : 'points'
  end

  # rubocop:disable Style/EmptyElse
  def match_winner
    if human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    else
      nil
    end
  end
  # rubocop:enable Style/EmptyElse

  def game_winner
    score.any? { |_, v| v >= 10 }
  end

  def display_match_winner
    puts
    prompt(if match_winner
             "#{match_winner.name} wins the match!"
           else
             "It's a tie!"
           end)
  end

  def display_game_winner
    puts
    prompt "#{score.key(10).name} wins the game!"
  end

  def play_again?
    answer = nil
    loop do
      puts
      prompt_yml 'play_again'
      answer = gets.chomp.downcase
      break if answer[0] == 'y' || answer[0] == 'n'
      prompt_yml 'play_again2'
    end
    answer.start_with? 'y'
  end
end

RPSgame.new.play
