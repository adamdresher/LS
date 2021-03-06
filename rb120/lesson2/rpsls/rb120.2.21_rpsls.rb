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

module Displayable
  def display_welcome_message(human)
    clear_screen
    puts
    prompt "Hello #{human.name}.  \
Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    prompt_yml 'goodbye'
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

  def display_moves(human, computer)
    puts
    # binding.pry
    prompt "#{human} chose #{human.move}"
    prompt "#{computer} chose #{computer.move}"
  end

  def display_match_winner(match_winner)
    puts
    prompt(if match_winner
             "#{match_winner} wins the match!"
           else
             "It's a tie!"
           end)
  end

  def display_game_winner(game_winner)
    puts
    prompt "#{game_winner} wins the game!"
  end

  def display_score(human, computer, records)
    score = records.score
    puts
    prompt "#{human} has #{score[human.name]} #{format_points(human, records)}"
    prompt "#{computer} has #{score[computer.name]} \
#{format_points(computer, records)}"
  end

  def display_winner_and_history(scoreboard)
    display_game_winner(game_winner) unless single_or_set == 1
    scoreboard.display_history(scoreboard) if valid?('display_history?')
  end

  def display_history(scoreboard)
    scoreboard.history_of_moves.each_with_index do |game, game_idx|
      puts
      prompt "Game # #{game_idx + 1}:"

      display_game_history(game)
    end
  end

  private

  def display_game_history(game)
    game.each_with_index do |match, match_idx|
      prompt "Match # #{match_idx + 1}:"

      match.each_pair do |player, move|
        print "              #{player} played #{move}".ljust(40)
      end
      puts
    end
  end

  def format_points(player, scoreboard)
    scoreboard.score[player] == 1 ? 'point' : 'points'
  end
end

module Moves # creates more lines, but feels more legible than separate classes
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

  OPTIONS = # classes are defined first
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

  def to_s
    name
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

module AI # each AI class has their own personality
  class Bender < Player
    # starts with random move and plays the same move 3 times
    # then repeats with new random move
    def set_name
      self.name = 'Bender'
    end

    def choose_move(records, computer, _)
      self.move = if records.last.size % 3 == 0
                    OPTIONS[OPTIONS.keys.sample].new
                  else
                    records.last.last[computer.name]
                  end
    end
  end

  class Bishop < Player
    # randomly immitates another AI
    def set_name
      self.name = 'Bishop'
    end

    def choose_move(records, computer, human)
      self.ai_immitation = choose_who_to_immitate if records.last.size.zero?
      self.move = ai_immitation.choose_move(records, computer, human)
    end

    private

    attr_accessor :ai_immitation

    def choose_who_to_immitate
      CHOICES.sample.new
    end
  end

  class Data < Player
    # starts with paper
    # then random moves
    def set_name
      self.name = 'Data'
    end

    def choose_move(records, _, _)
      self.move = if records.last.size.zero?
                    Paper.new
                  else
                    OPTIONS[OPTIONS.keys.sample].new
                  end
    end
  end

  class RoyBatty < Player
    # starts with lizard
    # then chooses the losing move against the opponent's previous move
    def set_name
      self.name = 'Roy Batty'
    end

    def choose_move(records, _, human)
      self.move = if records.last.size.zero?
                    Lizard.new
                  else
                    choose_previous_losing_move(records, human)
                  end
    end

    private

    def choose_previous_losing_move(records, human)
      # guards against Spock with a capital S
      human_move = records.last.last[human.name].to_s.downcase.to_sym
      winning_move = OPTIONS[human_move].new
      losing_move = nil
      until winning_move > losing_move
        losing_move = OPTIONS[OPTIONS.keys.sample].new
      end
      losing_move
    end
  end

  class R2D2 < Player
    # starts with rock
    # then chooses opponents previous move
    def set_name
      self.name = 'R2D2'
    end

    def choose_move(records, _, human)
      self.move = if records.last.size.zero?
                    Rock.new
                  else
                    records.last.last[human.name]
                  end
    end
  end

  # custom classes must be defined first
  CHOICES = [Bender, Bishop, Data, RoyBatty, R2D2]
end

class Computer
  include AI
  attr_reader :ai

  def initialize
    @ai = CHOICES.sample.new
  end
end

# game engine
class RPSgame
  include Viewable
  include Displayable

  attr_reader :human, :computer, :scoreboard

  def initialize
    @human = Human.new
    @computer = Computer.new.ai
    @scoreboard = Scoreboard.new(human, computer)
    @single_or_set = nil
  end

  def play
    display_welcome_message(human)
    loop do
      setup_game
      play_game_match_or_set
      display_winner_and_history(scoreboard)
      break unless valid?('play_again?')
      clear_screen
    end
    display_goodbye_message
  end

  private

  attr_accessor :single_or_set
  attr_writer :human, :computer

  def setup_game # future: let user choose ai or random
    @computer = Computer.new.ai unless scoreboard.score.any?(0)
    setup_scoreboard
    choose_single_or_set
  end

  def setup_scoreboard
    scoreboard.history_of_moves << []
    scoreboard.reset_score(human, computer)
  end

  def play_game_match_or_set
    single_or_set == 1 ? play_match : play_set
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

  def play_match
    clear_screen
    human.choose_move
    computer.choose_move(scoreboard.history_of_moves, computer, human)
    scoreboard.record_move(human, computer)
    display_moves(human, computer)
    display_match_winner(match_winner)
  end

  def play_set
    loop do
      play_match
      scoreboard.add_point(match_winner) if match_winner
      display_score(human, computer, scoreboard)
      break if game_winner?
      prompt_yml2 'press_enter'
      gets
    end
  end

  # rubocop:disable Style/EmptyElse
  def match_winner
    if human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    else
      nil # display_match_winner returns a tie
    end
  end
  # rubocop:enable Style/EmptyElse

  def game_winner
    scoreboard.score.key(10)
  end

  def game_winner?
    scoreboard.score.any? { |_, v| v >= 10 }
  end

  def valid?(answer)
    choice = nil
    loop do
      puts
      prompt_yml answer
      choice = gets.chomp.downcase
      break if choice[0] == 'y' || choice[0] == 'n'
      prompt_yml 'try_again'
    end
    choice.start_with? 'y'
  end
end

class Scoreboard < RPSgame
  include Viewable
  include Displayable

  attr_accessor :score
  attr_reader :history_of_moves

  def initialize(human, computer)
    @score = { human.name => 0, computer.name => 0 }
    @history_of_moves = []
  end

  def add_point(player)
    score[player.name] += 1
  end

  def reset_score(human, computer)
    self.score = { human.name => 0, computer.name => 0 }
  end

  def record_move(human, computer)
    moves = { human.name => human.move, computer.name => computer.move }
    history_of_moves[-1] << moves
  end
end

# user interface
RPSgame.new.play
