require 'pry'
require 'pry-byebug'

CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
WORTH = {'2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9, '10'=>10, 'jack'=>10, 'queen'=>10, 'king'=>10, 'ace'=>[1, 11]}

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  CARD_NAMES * 4
end

def draw_card(dck)
  dck.pop
end

def initialize_hand(dck)
  player_hand, dealer_hand = [], []

  2.times { dck.shuffle! }
  2.times do
    player_hand << draw_card(dck)
    dealer_hand << draw_card(dck)
  end

  [player_hand, dealer_hand]
end

def display_board(playr_hnd, dealr_hnd, reveal_dealr_crd=false)
  prompt "You have: #{joinor(playr_hnd)}"

  if reveal_dealr_crd
    prompt "Dealer has: #{joinor(dealr_hnd)}"
  else
    prompt "Dealer has: #{dealr_hnd[0]} and unknown card."
  end
end

def joinor(hnd) # not accounting for dealer's hidden card
  case hnd.size
  when 2 then hnd.join(' & ')
  when 3.. then hnd[0..-2].join(', ') << ', & ' << hnd[-1].to_s
  end
end

def player_turn!(dck, playr_hnd, dealr_hnd)
  loop do
    break if someone_busts(playr_hnd)
    prompt "Would you like to draw or stay?"
    choice = gets[0].downcase
    if choice == 'd'
      playr_hnd.push(draw_card(dck))
    elsif choice == 's'
      break
    end
    display_board(playr_hnd, dealr_hnd)
  end

end

def dealer_turn!(dck, dealr_hnd)
end

def determine_points(hnd) # does not handle aces
  hnd.map { |card| WORTH[card] }.sum
end

def determine_points_winner(playr_hnd, dealr_hnd)
  playr = determine_points(playr_hnd)
  dealr = determine_points(dealr_hnd)
  playr > dealr ? 'Player wins!' : 'Dealer wins!'
end

def someone_busts(hnd)
  true if determine_points(hnd) > 21
end

def display_winner(playr_hnd, dealr_hnd)
  winner = case
           when someone_busts(playr_hnd) then 'Dealer wins!'
           when someone_busts(dealr_hnd) then 'Player wins!'
           else determine_points_winner(playr_hnd, dealr_hnd)
           end
  display_board(playr_hnd, dealr_hnd, true)
  prompt(winner)
end

# gameplay, start
loop do
  deck = CARD_NAMES * 4
  player_hand, dealer_hand = initialize_hand(deck)

  # binding.pry
  display_board(player_hand, dealer_hand)
  player_turn!(deck, player_hand, dealer_hand)
  return display_winner(player_hand, dealer_hand) if someone_busts(player_hand)

  dealer_turn!(deck, dealer_hand)
  return display_winner(player_hand, dealer_hand) if someone_busts(dealer_hand)

  display_winner(player_hand, dealer_hand)
  break
end

# Algorithm:
# 1. Initialize a deck:
# 2. Pass out cards:
#   - give player two cards, 'face up'
#   - give dealer two cards, one 'face up' and another 'face down' (hidden)
# 3. Player's turn:
#   - player 'hit' or 'stay'
#   - repeat Step 3 unless player 'busts' or 'stays'
# 4. If player 'busts', dealer wins
# 5. Dealer's turn:
#   - show 'face down' card
#   - dealer 'hit' if hand is < 16
#   - repeat Step 4 until hand is >= 17
# 6. If dealer busts, player wins
# 7. If no busts, compare hands and declare the winner
# 8. Play again? 
#   - return to Step 1 if 'yes'
#   - goodbye!
