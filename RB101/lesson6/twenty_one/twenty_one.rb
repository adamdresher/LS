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

def initialize_hand(dck)
  player_hand = []
  dealer_hand = []

  2.times { dck.shuffle! }
  2.times do
    player_hand << draw_card!(dck)
    dealer_hand << draw_card!(dck)
  end

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

def display_board(playr_hnd, dealr_hnd, reveal_dealr_crd=false)
  new_line
  prompt "You have: #{joinor(playr_hnd)} \
(#{determine_points(playr_hnd)} points)"

  if reveal_dealr_crd
    prompt "Dealer has: #{joinor(dealr_hnd)} \
(#{determine_points(dealr_hnd)} points)"
  else
    prompt "Dealer has: #{dealr_hnd[0]} and an unknown card."
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
def player_turn!(dck, playr_hnd, dealr_hnd)
  loop do
    break if someone_busts(playr_hnd)
    choice = nil

    loop do
      clear_screen
      display_board(playr_hnd, dealr_hnd)
      new_line
      prompt "Player's turn:"
      prompt "Would you like to (d)raw or (s)tay?"
      choice = gets[0].downcase
      break if ['s', 'd'].include? choice
      prompt "Sorry, please enter 'd' for draw or 's' for stay."
    end

    if choice == 'd'
      new_card = draw_card!(dck)
      prompt "Player receives a #{new_card}."
      playr_hnd << new_card
      pause(0.5)
    elsif choice == 's'
      pause(0.5)
      break
    end
  end
end

def dealer_turn!(dck, playr_hnd, dealr_hnd)
  loop do
    break if someone_busts(dealr_hnd)
    clear_screen

    display_board(playr_hnd, dealr_hnd, true)
    new_line
    prompt "Dealer's turn:"
    if determine_points(dealr_hnd) < 17
      prompt "Dealer chooses to draw."
      pause(0.5)
      new_line

      new_card = draw_card!(dck)
      prompt "Dealer receives a #{new_card}."
      dealr_hnd << new_card
    else
      prompt "Dealer chooses to stay."
      break
    end
    pause(1)
  end
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

# aces are calculated last to ensure aces can be reassigned
def aces_go_last(hnd)
  hnd.each_with_object([]) do |card, new_hnd|
    card == 'ace' ? new_hnd.append(card) : new_hnd.prepend(card)
  end
end

def determine_points(hnd)
  hand_val = []
  hnd = aces_go_last(hnd)

  hnd.flat_map do |card|
    hand_val << if card == 'ace'
                  (hand_val.flatten.sum > 10 ? WORTH[card][0] : WORTH[card][1])
                else
                  WORTH[card][0]
                end
  end
  hand_val.sum
end

def determine_points_winner(playr_hnd, dealr_hnd)
  playr = determine_points(playr_hnd)
  dealr = determine_points(dealr_hnd)
  playr > dealr ? PLAYER_WINS[1] : DEALER_WINS[1]
end

def someone_busts(hnd)
  determine_points(hnd) > 21
end

def display_winner(playr_hnd, dealr_hnd)
  winner = if someone_busts(playr_hnd)
             DEALER_WINS.join
           elsif someone_busts(dealr_hnd)
             PLAYER_WINS.join
           else
             determine_points_winner(playr_hnd, dealr_hnd)
           end
  display_board(playr_hnd, dealr_hnd, true)
  new_line
  prompt(winner)
end

# main loop
display_greeting

loop do
  deck = CARD_NAMES * 4
  player_hand, dealer_hand = initialize_hand(deck)

  # gameplay, start
  loop do
    player_turn!(deck, player_hand, dealer_hand)
    break if someone_busts(player_hand)

    dealer_turn!(deck, player_hand, dealer_hand)
    break if someone_busts(dealer_hand)
    break
  end

  display_winner(player_hand, dealer_hand)
  pause(1)
  new_line
  prompt "Do you want to play again? (y)es or (n)o"
  break unless gets.chomp.downcase.start_with?('y')
end

prompt "Okay, goodbye!"
