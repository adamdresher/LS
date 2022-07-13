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

module Moves
  class Rock
    def to_s
      'rock'
    end

    def >(other_move)
      [Lizard, Scissors].include? other_move.class
    end

    def <(other_move)
      [Paper, Spock].include? other_move.class
    end
  end

  class Paper
    def to_s
      'paper'
    end

    def >(other_move)
      [Rock, Spock].include? other_move.class
    end

    def <(other_move)
      [Scissors, Lizard].include? other_move.class
    end
  end

  class Scissors
    def to_s
      'scissors'
    end

    def >(other_move)
      [Paper, Lizard].include? other_move.class
    end

    def <(other_move)
      [Spock, Rock].include? other_move.class
    end
  end

  class Lizard
    def to_s
      'lizard'
    end

    def >(other_move)
      [Paper, Spock].include? other_move.class
    end

    def <(other_move)
      [Rock, Scissors].include? other_move.class
    end
  end

  class Spock
    def to_s
      'Spock'
    end

    def >(other_move)
      [Scissors, Rock].include? other_move.class
    end

    def <(other_move)
      [Lizard, Paper].include? other_move.class
    end
  end

  OPTIONS =
    { rock: Rock,
      paper: Paper,
      scissors: Scissors,
      lizard: Lizard,
      spock: Spock }
end

class Player
  include Viewable
  include Moves

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
      break if OPTIONS.key? choice.to_sym
      prompt_yml 'choose_move2'
      pause_and_clear_screen
    end
    self.move = OPTIONS[choice.to_sym].new
  end

  private

  def pause_and_clear_screen
    sleep 0.5
    clear_screen
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Bishop', 'Bender', 'Data', 'Roy Batty'].sample
  end

  def choose_move
    choice = OPTIONS[OPTIONS.keys.sample]
    self.move = choice.new
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
    prompt "#{human.name} chose #{human.move}" # check
    prompt "#{computer.name} chose #{computer.move}" # check
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
