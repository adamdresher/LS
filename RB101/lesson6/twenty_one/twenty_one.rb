require 'yaml'
require 'pry'
require 'pry-byebug'

MESSAGES = YAML.load_file('twenty_one_messages.yml')
CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
# suit isn't relevant to the game requirements, so it was ignored
WORTH = { '2' => [2], '3' => [3], '4' => [4], '5' => [5], '6' => [6],
          '7' => [7], '8' => [8], '9' => [9], '10' => [10], 'jack' => [10],
          'queen' => [10], 'king' => [10], 'ace' => [1, 11] }

def prompt(msg)
  puts "=> #{msg}"
end

def prompt_yaml(msg)
  puts "=> #{MESSAGES[msg]}"
end

def prompt_yaml_(msg)
  puts "#{MESSAGES[msg]}"
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

def initialize_hand(total, dck)
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
  prompt_yaml_ 'welcome'
  new_line
  prompt_yaml_ 'rules0'
  prompt_yaml_ 'rules1'
  prompt_yaml_ 'rules2'
  prompt_yaml_ 'rules3'
  new_line
  prompt_yaml_ 'rules4'
  new_line(2)
  prompt_yaml_ 'rules5'
  gets
end

def display_board(ttl_mtch, total, playr_hnd, dealr_hnd, reveal_dealr_crd=false)
  new_line
  puts "   Match score: You - #{ttl_mtch['Player']}, Dealer - #{ttl_mtch['Dealer']}"
  prompt_yaml_ 'line'
  prompt "You have: #{joinor(playr_hnd)} (#{total[:player_points]} points)"

  if reveal_dealr_crd
    prompt "Dealer has: #{joinor(dealr_hnd)} (#{total[:dealer_points]} points)"
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
def choose_turn(ttl_mtch, total, playr_hnd, dealr_hnd)
  choice = nil
  loop do
    clear_screen
    display_board(ttl_mtch, total, playr_hnd, dealr_hnd)
    new_line

    prompt_yaml 'player_turn'
    prompt_yaml 'draw_or_stay'
    choice = gets[0].downcase
    break if ['s', 'd'].include? choice
    prompt_yaml 'draw_or_stay_validation'
    pause(1)
  end
  choice
end

def player_draws(total, dck, playr_hnd)
  new_card = draw_card!(dck)
  prompt "Player receives a #{new_card}."
  playr_hnd << new_card
  update_points!(playr_hnd, total, :player_points)
end

def player_turn!(ttl_mtch, total, dck, playr_hnd, dealr_hnd)
  loop do
    break if someone_busts?(total[:player_points])
    choice = choose_turn(ttl_mtch, total, playr_hnd, dealr_hnd)

    if choice == 'd'
      player_draws(total, dck, playr_hnd)
      pause(0.5)
    elsif choice == 's'
      prompt_yaml 'player_stay'
      pause(0.5)
      break
    end
  end
end

def dealer_turn!(ttl_mtch, total, dck, playr_hnd, dealr_hnd)
  return if someone_busts?(total[:player_points])
  loop do
    break if someone_busts?(total[:dealer_points])
    clear_screen

    display_board(ttl_mtch, total, playr_hnd, dealr_hnd, true)
    new_line
    prompt_yaml 'dealer_turn'
    if total[:dealer_points] < 17
      prompt_yaml 'dealer_draw'
      pause(1)
      new_line

      new_card = draw_card!(dck)
      prompt "Dealer receives a #{new_card}."
      dealr_hnd << new_card
      update_points!(dealr_hnd, total, :dealer_points)
    else
      prompt_yaml 'dealer_stay'
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

def display_match_winner(winner, busts)
  match_winner = if    winner == :dealer && busts == :player
                   'player_busts'
                 elsif winner == :player && busts == :dealer
                   'dealer_busts'
                 elsif winner == :player && busts == nil
                   'player_wins'
                 elsif winner == :dealer && busts == nil
                   'dealer_wins'
                 end

  prompt_yaml match_winner
end

def update_match_wins!(ttl_mtch, winner)
  if winner == :player
    ttl_mtch['Player'] += 1
  elsif winner == :dealer
    ttl_mtch['Dealer'] += 1
  end
end

def game_winner?(ttl_mtch)
  ttl_mtch.value?(5)
end

# gameplay starts
display_greeting

loop do # main loop
  total_matches = Hash.new(0) # mutated with Integer#+

  loop do # match loop
    deck = CARD_NAMES * 4
    total = Hash.new # updates when any cards are given
    player_hand, dealer_hand = initialize_hand(total, deck)

    player_turn!(total_matches, total, deck, player_hand, dealer_hand)
    dealer_turn!(total_matches, total, deck, player_hand, dealer_hand)

    clear_screen
    display_board(total_matches, total, player_hand, dealer_hand, true)

    new_line
    winner, busts = determine_winner(total)
    display_match_winner(winner, busts)
    update_match_wins!(total_matches, winner)
    pause(1)
    break if game_winner?(total_matches)
    
    new_line
    prompt_yaml 'ready_for_next_match?'
    gets
  end

  puts "#{total_matches.key(5)} has won the game!"
  pause(1)

  new_line
  prompt_yaml 'play_again'
  break unless gets.chomp.downcase.start_with?('y')
end

prompt_yaml 'goodbye'

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
# - output match score at the top of each turn # DONE
# - add some buffer between match win and game win outputs # DONE

# - Thank Seb for tip about regularly committing (it forces me to chunk work and think in smaller steps)
