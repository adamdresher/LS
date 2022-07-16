require 'pry'
require 'pry-byebug'
require 'pry-gem'
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

################################################################################

# Or should I namespace the robots in a AI module and inherit from Player/Computer?
# - who inherits the namespaces module?
#   - makes most logical sense for namespaced robots to inherit from Player,
#     then have namespaced module mixin to Computer
#     - Player then passes initialize directly to the robots before Computer
#       - this should allow set_name to be invoked

module AI
   # not accessible to classes within the namespacing module
   # must be mixin or inherited
  # def starting_move
  #   'rock'
  # end

    # if this method is defined as set_name instead of to_s
    # then, this class can inherit directly from Player and can be initialized
    # then can mixin AI as a module with desirable behaviors
    # can inherit from Computer, which can mixin AI and inherit from Player

# scoreboard = [[{human => human.move, computer => computer.move}, # game 1
#                {human => human.move, computer => computer.move},
#                {human => human.move, computer => computer.move},
#                # ... x10 matches total
#                {human => human.move, computer => computer.move}],
#               [{human => human.move, computer => computer.move}], # game 2
#               [{human => human.move, computer => computer.move}]] # game 3

  class Bender < Player
    def set_name
      self.name = 'Bender'
    end

    def choose_move(records, computer, human)
      if records.size - 1 % 3 == 0
        self.move = OPTIONS[OPTIONS.keys.sample].new
      else
        self.move = records[-2][-1][computer]
      end
    end
  end

  class Bishop < Player
    def set_name
      self.name = 'Bishop'
    end

    def choose_move(records, computer, human)
      if records.size == 1
        self.move = OPTIONS[OPTIONS.keys.sample].new
      else
        return self.move if self.move
        self.move = CHOICES.sample.new.choose_move(records, computer, human)
      end
    end
  end

  class Data < Player
    def set_name
      self.name = 'Data'
    end

    def choose_move(records, computer, human)
        if records.size - 1 % 3 == 0
          self.move = Paper.new
        else
          self.move = OPTIONS[OPTIONS.keys.sample].new
        end
    end
  end

  class Roy_Batty < Player
    def set_name
      self.name = 'Roy Batty'
    end

    def choose_move(records, computer, human)
      self.move = (if records.size -1 % 3 == 0
                    Lizard.new
                  else
                    human_move = OPTIONS[records[-2][-1][human].downcase.to_sym].new
                    losing_move = nil
                    until human_move > losing_move
                      losing_move = OPTIONS[OPTIONS.keys.sample].new
                    end
                    losing_move
                  end)
    end
  end

  class R2D2 < Player
    def set_name
      self.name = 'R2D2'
    end

    def choose_move(records, computer, human)
      if records.size == 1
        self.move = Rock.new
      else
        self.move = records[-2][-1][human]
      end
    end
  end

  CHOICES = [Bender, Bishop, Data, Roy_Batty, R2D2]
end

class Computer
  include AI
  attr_reader :ai

  def initialize
    @ai = CHOICES.sample.new # production
    # @ai = AI::Bishop.new # test
  end

  # def choose_move
  #   choice = OPTIONS[OPTIONS.keys.sample]
  #   self.move = choice.new
  # end
end


# scoreboard = [[{:human => 'rock', :computer => 'paper'}], # game 1
#                [{:human => 'Spock', :computer => 'rock'}, # game 2
#                {:human => 'Spock', :computer => 'rock'},
#                # ... x10 matches total
#                {:human => 'Spock', :computer => 'rock'}],
#               [{:human => 'Spock', :computer => 'paper'}], # game 3
#               [{:human => 'paper', :computer => 'scissors'}], # game 4
#               [{:human => 'paper', :computer => 'scissors'}], # game 5
#               [{:human => 'Spock', :computer => 'lizard'}]] # game 6

# robot = Computer.new
# puts robot.ai.name
# puts robot.ai.choose_move(scoreboard, :computer, :human)

# game engine
class RPSgame
  include Viewable
  attr_reader :human, :computer, :scoreboard

  def initialize
    @human = Human.new
    @computer = Computer.new.ai
    @scoreboard = Scoreboard.new
    @single_or_set = nil
  end

  def play
    display_welcome_message
    loop do
      setup_game
      single_or_set == 1 ? play_match : play_set
      display_game_winner unless single_or_set == 1
      scoreboard.display_history(human, computer) if valid?('display_history?')
      break unless valid?('play_again?')
      clear_screen
    end
    display_goodbye_message
  end

  private

  attr_accessor :single_or_set
  attr_writer :human, :computer

  def display_welcome_message
    clear_screen
    puts
    prompt "Hello #{human.name}.  \
Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    prompt_yml 'goodbye'
  end

  def setup_game
    setup_scoreboard
    choose_single_or_set
  end

  def setup_scoreboard
    scoreboard.history_of_moves << []
    scoreboard.reset_score(human, computer)
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
    # binding.pry
    human.choose_move
    computer.choose_move(scoreboard.history_of_moves, computer, human)
    scoreboard.record_move(human, computer)
    display_moves
    display_match_winner
  end

  def play_set
    loop do
      play_match
      scoreboard.add_point(match_winner) if match_winner
      scoreboard.display_score(human, computer)
      break if game_winner
      prompt_yml2 'press_enter'
      gets
    end
  end

  def display_moves
    puts
    prompt "#{human} chose #{human.move}"
    prompt "#{computer} chose #{computer.move}"
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
    scoreboard.score.any? { |_, v| v >= 10 }
  end

  def display_match_winner
    puts
    prompt(if match_winner
             "#{match_winner} wins the match!"
           else
             "It's a tie!"
           end)
  end

  def display_game_winner
    puts
    prompt "#{scoreboard.score.key(10).name} wins the game!"
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
  attr_accessor :score
  attr_reader :history_of_moves

  def initialize
    @score = { human => 0, computer => 0 }
    @history_of_moves = []
  end

  def add_point(player)
    score[player] += 1
  end

  def reset_score(human, computer)
    self.score = { human => 0, computer => 0 }
  end

  def display_score(human, computer)
    puts
    prompt "#{human} has #{score[human]} #{format_points(human)}"
    prompt "#{computer} has #{score[computer]} #{format_points(computer)}"
  end

  def format_points(player)
    score[player] == 1 ? 'point' : 'points'
  end

  def record_move(human, computer)
    history_of_moves[-1] << { human => human.move, computer => computer.move }
  end

  def display_history(human, computer)
    history_of_moves.each_with_index do |game, game_idx|
      puts
      prompt "Game # #{game_idx + 1}:"

      game.each_with_index do |match, match_idx|
        prompt "Match # #{match_idx + 1}:"
        puts "              #{human} played #{match[human]}".ljust(40) + "  " +
             "#{computer} played #{match[computer]}".ljust(30)
      end
    end
  end
end

RPSgame.new.play
