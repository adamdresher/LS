CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
WORTH = {'2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9, '10'=>10, 'jack'=>10, 'queen'=>10, 'king'=>10, 'ace'=>[1, 11]}

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  CARD_NAMES * 4
end

def initial_hand(dck)
  player_hand, dealer_hand = [], []

  2.times { dck.shuffle! }
  2.times do
    player_hand << dck.pop
    dealer_hand << dck.pop
  end

  [player_hand, dealer_hand]
end

def display_board(playr_hnd, dealr_hnd, reveal_dealrs_crd)
  prompt "You have: #{joinor(playr_hnd)}"

  if reveal_dealrs_crd
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

def player_turn(dck, playr_hnd, bust, reveal_dealrs_crd)
  reveal_dealrs_crd = true
  if 
end

def dealer_turn(dck, dealr_hnd, bust)
end

def determine_points_winner(playr_hnd, dealr_hnd) # does not handle aces
  player = playr_hnd.map { |card| WORTH[card] }.sum
  dealer = dealr_hnd.map { |card| WORTH[card] }.sum
  [player, dealer]
end

def someone_busts(dtrmn_pnts_wnnr, playr_hnd, dealr_hnd)
  'Dealer' if dtrmn_pnts_wnnr(playr_hnd, dealr_hnd)[1] > 21
  'Player' if dtrmn_pnts_wnnr(playr_hnd, dealr_hnd)[0] > 21
end

def display_winner(bust, dtrmn_pnts_wnnr, playr_hnd, dealr_hnd)
  case bust
  when 'Player' then 'Dealer'
  when 'Dealer' then 'Player'
  else dtrmn_pnts_wnnr(playr_hnd, dealr_hnd)
  end
end

# gameplay, start
loop do
  deck = CARD_NAMES * 4
  player_hand, dealer_hand = initial_hand(deck)
  reveal_dealers_card = false

  display_board(player_hand, dealer_hand, reveal_dealers_card)
  # player_turn(deck, player_hand, reveal_dealers_card)
  break if someone_busts(dtrmn_pnts_wnnr, playr_hnd, dealr_hnd)
  # dealer_turn(deck, dealer_hand)
  break if someone_busts(dtrmn_pnts_wnnr, playr_hnd, dealr_hnd)
  display_winner(someone_busts, determine_points_winner, playr_hnd, dealr_hnd)
end

display_winner(someone_busts, determine_points_winner, playr_hnd, dealr_hnd)

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
