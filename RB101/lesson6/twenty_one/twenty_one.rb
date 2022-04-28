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

  winner, busts = if    someone_busts?(total_playr_pnts)
                    [:dealer, :player]
                  elsif someone_busts?(total_dealr_pnts)
                    [:player, :dealer]
                  else
                    if total_playr_pnts > total_dealr_pnts
                      [:player, nil]
                    else
                      [:dealer, nil]
                    end
                  end

  [winner, busts]
end

def display_match_winner(total, playr_hnd, dealr_hnd, winner, busts)
  match_winner = if    winner == :dealer && busts == :player
                   DEALER_WINS.join
                 elsif winner == :player && busts == :dealer
                   PLAYER_WINS.join
                 elsif winner == :player && busts == nil
                   PLAYER_WINS[1]
                 elsif winner == :dealer && busts == nil
                   DEALER_WINS[1]
                 end

  display_board(total, playr_hnd, dealr_hnd, true)
  new_line
  prompt(match_winner)
end

def update_match_wins!(total_matches, winner)
  if winner == :player
    total_matches['Player'] += 1
  elsif winner == :dealer
    total_matches['Dealer'] += 1
  end
end

def game_winner?(total_matches)
  total_matches.value?(5)
end

# add display_game_winner

# gameplay starts
display_greeting

loop do # main loop
  total_matches = Hash.new(0) # mutated with Integer#+

  loop do # match loop
    deck = CARD_NAMES * 4
    total = Hash.new # updates when any cards are given
    player_hand, dealer_hand = initialize_hand(deck, total)

    player_turn!(deck, total, player_hand, dealer_hand)
    dealer_turn!(deck, total, player_hand, dealer_hand)

    winner, busts = determine_winner(total)
    display_match_winner(total, player_hand, dealer_hand, winner, busts)
    update_match_wins!(total_matches, winner)
    pause(1)
    break if game_winner?(total_matches)
  end

  puts "#{total_matches.key(5)} has won the game!"
  pause(1) # temp

  prompt "Do you want to play again? (y)es or no (any key)"
  break unless gets.chomp.downcase.start_with?('y')
end

prompt "Okay, goodbye!"

# - setup 'first to win 5 hands, wins the game'
# - setup variables to control cap number (21) and dealer's break point (17)

# - add total_match variable # DONE
# - set hash to total_match: # NOT NEEDED, KEYS CAN BE CREATED DURING INCREMENTATION
#   - set keys, player_wins: 0, dealer_wins: 0
# - modify determine_winner to mutate total_match: # NOT PRETTY BUT DONE
#   - key += 1
# - create method to determine if game_winner is found # DONE
#   - select key if its value is 5
# - if game_winner is true, output a string with congrats # DONE
# - ask if player wants to play again # DONE
# - update name to display_match_winner # DONE
# - output match score at the top of each turn
# - add some buffer between match win and game win outputs

# - Thank Seb for tip about regularly committing (it forces me to chunk work and think in smaller steps)
