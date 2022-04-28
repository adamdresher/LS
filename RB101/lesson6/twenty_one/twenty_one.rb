require 'pry'
require 'pry-byebug'

CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
# suit isn't relevant to the game requirements, so it was ignored
WORTH = { '2' => [2], '3' => [3], '4' => [4], '5' => [5], '6' => [6],
          '7' => [7], '8' => [8], '9' => [9], '10' => [10], 'jack' => [10],
          'queen' => [10], 'king' => [10], 'ace' => [1, 11] }
PLAYER_WINS = ['Dealer busts, ', 'Player wins!'] # should use a YAML
DEALER_WINS = ['Player busts, ', 'Dealer wins!']

def prompt(msg)
  puts "=> #{msg}"
end

def new_line(lines=1)
  lines.times { puts }
end

def clear_screen
  system 'clear'
end

def pause(time)
  sleep(time)
end

def initialize_deck
  CARD_NAMES * 4
end

def draw_card!(dck)
  dck.pop
end

def initialize_hand(dck, total)
  player_hand = []
  dealer_hand = []

  2.times { dck.shuffle! }
  2.times do
    player_hand << draw_card!(dck)
    dealer_hand << draw_card!(dck)
  end

  update_points!(player_hand, total, :player_points)
  update_points!(dealer_hand, total, :dealer_points)

  [player_hand, dealer_hand]
end

def display_greeting
  clear_screen
  new_line(6) # can create a YAML if there's time
  puts "                          Welcome to Twenty-One!"
  pause(1)
  new_line
  puts "                                GAME RULES:"
  puts "    The goal of the game is to reach as close to 21 without going over."
  puts "                         (The dealer wins a tie =p)"
  new_line
  puts "    You can (d)raw a card or (s)tay and let the dealer begin its turn."
  new_line(2)
  puts "                 Press Enter when you are ready to begin."
  gets.chomp
end

def display_board(total, playr_hnd, dealr_hnd, reveal_dealr_crd=false)
  new_line
  prompt "You have: #{joinor(playr_hnd)} \
(#{total[:player_points]} points)"

  if reveal_dealr_crd
    prompt "Dealer has: #{joinor(dealr_hnd)} \
(#{total[:dealer_points]} points)"
  else
    prompt "Dealer has: #{dealr_hnd[0]} and an unknown card"
  end
end

def joinor(hnd)
  if hnd.size == 2
    hnd.join(' & ')
  elsif hnd.size >= 3
    hnd[0..-2].join(', ') + ', & ' + hnd[-1].to_s
  end
end

# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
# offenses are due to string outputs
def choose_turn(total, playr_hnd, dealr_hnd)
  choice = nil
  loop do
    clear_screen
    display_board(total, playr_hnd, dealr_hnd)
    new_line

    prompt "Player's turn:"
    prompt "Would you like to (d)raw or (s)tay?"
    choice = gets[0].downcase
    break if ['s', 'd'].include? choice
    prompt "Sorry, please enter 'd' for draw or 's' for stay."
    pause(1)
  end
  choice
end

def player_draws(dck, total, playr_hnd)
  new_card = draw_card!(dck)
  prompt "Player receives a #{new_card}."
  playr_hnd << new_card
  update_points!(playr_hnd, total, :player_points)
end

def player_turn!(dck, total, playr_hnd, dealr_hnd)
  loop do
    break if someone_busts?(total[:player_points])
    choice = choose_turn(total, playr_hnd, dealr_hnd)

    if choice == 'd'
      player_draws(dck, total, playr_hnd)
      pause(0.5)
    elsif choice == 's'
      prompt "Player stays."
      pause(0.5)
      break
    end
  end
end

def dealer_turn!(dck, total, playr_hnd, dealr_hnd)
  return if someone_busts?(total[:player_points])
  loop do
    break if someone_busts?(total[:dealer_points])
    clear_screen

    display_board(total, playr_hnd, dealr_hnd, true)
    new_line
    prompt "Dealer's turn:"
    if total[:dealer_points] < 17
      prompt "Dealer chooses to draw."
      pause(1)
      new_line

      new_card = draw_card!(dck)
      prompt "Dealer receives a #{new_card}."
      dealr_hnd << new_card
      update_points!(dealr_hnd, total, :dealer_points)
    else
      prompt "Dealer chooses to stay."
      break
    end
    pause(1)
  end
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

# aces are calculated last to ensure their values can be properly
def aces_go_last(hnd)
  hnd.each_with_object([]) do |card, new_hnd|
    card == 'ace' ? new_hnd.append(card) : new_hnd.prepend(card)
  end
end

def update_points!(hnd, total, current_turn)
  hand_val = []
  hnd = aces_go_last(hnd)
  # binding.pry
  hnd.flat_map do |card|
    hand_val << if card == 'ace'
                  (hand_val.flatten.sum > 10 ? WORTH[card][0] : WORTH[card][1])
                else
                  WORTH[card][0]
                end
  end
  total[current_turn] = hand_val.sum
end

def someone_busts?(total)
  total > 21
end

def determine_winner(total)
  total_playr_pnts = total[:player_points]
  total_dealr_pnts = total[:dealer_points]

  if someone_busts?(total_playr_pnts)
    DEALER_WINS.join
  elsif someone_busts?(total_dealr_pnts)
    PLAYER_WINS.join
  else
    total_playr_pnts > total_dealr_pnts ? PLAYER_WINS[1] : DEALER_WINS[1]
  end
end

def display_winner(total, playr_hnd, dealr_hnd)
  winner = determine_winner(total)

  display_board(total, playr_hnd, dealr_hnd, true)
  new_line
  prompt(winner)
end

# main loop
display_greeting

loop do
  deck = CARD_NAMES * 4
  total = Hash.new # total is updated when any cards are given
  player_hand, dealer_hand = initialize_hand(deck, total)

  player_turn!(deck, total, player_hand, dealer_hand)
  dealer_turn!(deck, total, player_hand, dealer_hand)

  display_winner(total, player_hand, dealer_hand)
  pause(1)
  new_line
  prompt "Do you want to play again? (y)es or no (any key)"
  break unless gets.chomp.downcase.start_with?('y')
end

prompt "Okay, goodbye!"

# - update someone_busts name to someone_busts?
# - someone_busts checks total
# - update determine_points name to update_points!
# - update_points! which mutates total
# - refactor determine_points_winner, display_winner
# - update determine_points_winner name to determine_winner
# - determine_winner returns the winner
# - display_winner displays winner using determine_winner
# - setup 'first to win 5 hands, wins the game'
# - setup variables to control cap number (21) and dealer's break point (17)
