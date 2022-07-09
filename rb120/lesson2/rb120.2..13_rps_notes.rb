=begin
Problem:
  Create Rock, Paper, Scissors using OOP

Textual description of the problem:
  Rock, Papper, Scissors is a two-player game where each player chooses one of 
  three possible moves: rock, paper, or scissors.  Then chosen moves will then 
  be compared to see who wins, according to the following rules:

  - rock beats scissors
  - scissors beat paper
  - paper beats rock

  If the players choose the same move, it's a tie.

Major nouns and verbs extracted:
  Nouns:
    player, move, rule
  Verbs:
    choose, compare

Organized association of nouns and verbs:
  player
  - choose
  move
  rule

  - compare

  'choose' fits easily into a behavior of 'player', however deciding on which 
  noun should 'compare' is less straightforward.  My first thought is that 
  a 'rule' should 'compare' the 'move' each 'player' 'choose's.
=end

# Skeleton of the classes and methods organized through defined nouns and verbs:
class Player
  def initialize
    # should a player start with a move?
    # or maybe initialize a state for a move?
  end

  def choose
    # choose a move here?
  end
end

class Move
  def initialize
    # what should be tracked here?
  end
end

class Rule
  def initialize
    # what should the state of a rule object be?
  end
end

def compare(move1, move2)
  # where does this method belong?
end

# Next is a game engine to instigate the game:
RPSgame.new.play

# Skeleton of the game engine:
class RPSgame
  def initialize
  end

  def play
    display_welcome_message
    human_choose_move
    computer_choose_move
    display_winner
    display_goodbye_message
  end
end

# preparing scaffolding to extract duplicate behavior from 'choose_move'
class RPSgame
  def initialize
    @human = Person.new
    @computer = Person.new
  end

  def play
    display_welcome_message
    human_choose_move
    computer_choose_move
    display_winner
    display_goodbye_message
  end
end
