require 'yaml'

MESSAGES = YAML.load_file('twenty_one_messages.yml')
# SUITS = %w(spade heart club diamond)

SUITS = [[9828].pack('U*'), [9825].pack('U*'), [9831].pack('U*'), [9826].pack('U*')]

CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
# suit isn't relevant to the game requirements, so it was ignored
WORTH = { '2' => [2], '3' => [3], '4' => [4], '5' => [5], '6' => [6],
          '7' => [7], '8' => [8], '9' => [9], '10' => [10], 'jack' => [10],
          'queen' => [10], 'king' => [10], 'ace' => [1, 11] }
SCORE_LIMIT = 21
DEALER_STAYS = 17

def prompt(msg)
  puts "=> #{msg}"
end

def prompt_yaml(msg)
  puts "=> #{MESSAGES[msg]}"
end

def prompt_yaml_(msg)
  puts MESSAGES[msg]
end

def new_line(lines=1)
  lines.times { puts }
end

def clear_screen
  system 'clear'
end

def pause(time, msg=nil, output=false)
  return sleep(time) unless output

  print "=> #{msg[0]} "
  time.times do
    print '.'
    sleep 0.1
  end
  puts " #{msg[1]}!"
  sleep 1
end

def shuffling
  pause(15, ['Shuffling ', 'FINISHED'], true)
end

def drumroll(ttl_wins)
  prompt 'Drumroll please!'
  pause(20, ['And the winner is ', "the #{ttl_wins.key(5)}"], true)
  puts ""
end

def initialize_deck
  CARD_NAMES.product(SUITS)
end

def initialize_hand!(mtch_ttl, dck)
  hands = { playr: [], dealr: [] }

  2.times { dck.shuffle! }
  2.times do
    hands[:playr] << draw_card!(dck)
    hands[:dealr] << draw_card!(dck)
  end

  # update_points!(hands[:playr], mtch_ttl, :playr_points)
  # update_points!(hands[:dealr], mtch_ttl, :dealr_points)

  hands
end

def draw_card!(dck)
  dck.pop
end

# def display_cards(cards)
#   cards.each {|card| "#{card[0]} of #{card[1]}"}
# end

def display_greeting
  clear_screen
  new_line 6
  prompt_yaml_ 'welcome'
  new_line
  puts SUITS
  prompt_yaml_ 'rules0'
  prompt_yaml_ 'rules1' # should figure out how to add variables to yaml
  puts "   Win a hand/match by getting as close to #{SCORE_LIMIT}\
 as possible without going over."
  prompt_yaml_ 'rules3'
  new_line
  prompt_yaml_ 'rules4'
  new_line 2
  prompt_yaml_ 'rules5'
  gets
end

# delr_hnd is inconsistent with other methods in order to appease rubocop gods
def display_board(ttl_wins, mtch_ttl, hands, reveal_dealr=false)
  new_line
  puts "   Scoreboard: You - #{ttl_wins['Player']}, \
Dealer - #{ttl_wins['Dealer']}"
  prompt_yaml_ 'line'
  prompt "You have: #{joinor(hands[:playr])} \
(#{mtch_ttl[:playr_points]} points)"

  if reveal_dealr
    prompt "Dealer has: #{joinor(hands[:dealr])} \
(#{mtch_ttl[:dealr_points]} points)"
  else
    prompt "Dealer has: #{hands[:dealr][0]} and an unknown card"
  end
end

def joinor(hnd)
  if hnd.size == 2
    hnd.join(' & ')
  elsif hnd.size >= 3
    hnd[0..-2].join(', ') + ', & ' + hnd[-1].to_s
  end
end

def choose_turn(ttl_wins, mtch_ttl, hands)
  choice = nil
  loop do
    clear_screen
    display_board(ttl_wins, mtch_ttl, hands)
    new_line
    prompt_yaml 'player_turn'
    prompt_yaml 'draw_or_stay'
    choice = gets[0].downcase
    break if ['s', 'd'].include? choice

    prompt_yaml 'draw_or_stay_validation'
    pause 1
  end
  choice
end

def player_draws!(mtch_ttl, dck, playr_hnd)
  new_card = draw_card!(dck)
  prompt "Player receives a #{new_card}."
  playr_hnd << new_card

  update_points!(playr_hnd, mtch_ttl, :playr_points)
end

def player_turn!(ttl_wins, mtch_ttl, dck, hands)
  loop do
    break if someone_busts?(mtch_ttl[:playr_points])

    choice = choose_turn(ttl_wins, mtch_ttl, hands)
    if choice == 'd'
      player_draws!(mtch_ttl, dck, hands[:playr])
      pause 0.5
    elsif choice == 's'
      prompt_yaml 'player_stay'
      pause 0.5
      break

    end
  end
end

def dealer_draws!(dck, mtch_ttl, dealr_hnd)
  prompt_yaml 'dealer_draw'
  pause 1
  new_line
  new_card = draw_card!(dck)
  prompt "Dealer receives a #{new_card}."
  dealr_hnd << new_card

  update_points!(dealr_hnd, mtch_ttl, :dealr_points)
end

def dealer_turn!(ttl_wins, mtch_ttl, dck, hands)
  return if someone_busts?(mtch_ttl[:playr_points])

  loop do
    break if someone_busts?(mtch_ttl[:dealr_points])

    clear_screen
    display_board(ttl_wins, mtch_ttl, hands, true)
    new_line
    prompt_yaml 'dealer_turn'

    if mtch_ttl[:dealr_points] < DEALER_STAYS
      dealer_draws!(dck, mtch_ttl, hands[:dealr])
    else
      prompt_yaml 'dealer_stay'
      break

    end
    pause 1
  end
end

# aces are calculated last to ensure their values can be properly
def aces_go_last(hnd)
  hnd.each_with_object([]) do |card, new_hnd|
    card == 'ace' ? new_hnd.append(card) : new_hnd.prepend(card)
  end
end

def update_points!(hnd, mtch_ttl, current_turn)
  hand_val = []
  hnd = aces_go_last(hnd)

  hnd.flat_map do |card|
    hand_val << if card == 'ace'
                  if hand_val.flatten.sum > (SCORE_LIMIT - 11)
                    WORTH[card][0]
                  else
                    WORTH[card][1]
                  end
                else
                  WORTH[card][0]
                end
  end
  mtch_ttl[current_turn] = hand_val.sum
end

def someone_busts?(mtch_ttl)
  mtch_ttl > SCORE_LIMIT
end

def determine_winner(mtch_ttl)
  total_playr_pnts = mtch_ttl[:playr_points]
  total_dealr_pnts = mtch_ttl[:dealr_points]

  winner, busts = if someone_busts?(total_playr_pnts)
                    [:dealer, :player]
                  elsif someone_busts?(total_dealr_pnts)
                    [:player, :dealer]
                  elsif total_playr_pnts > total_dealr_pnts
                    [:player, :nil]
                  else
                    [:dealer, :nil]
                  end

  [winner, busts]
end

def display_match_winner(winner, busts)
  match_winner = case [winner, busts]
                 when [:dealer, :player] then 'player_busts'
                 when [:player, :dealer] then 'dealer_busts'
                 when [:player, :nil]    then 'player_wins'
                 when [:dealer, :nil]    then 'dealer_wins'
                 end

  prompt_yaml(match_winner)
end

def update_match_wins!(ttl_wins, winner)
  if winner == :player
    ttl_wins['Player'] += 1
  elsif winner == :dealer
    ttl_wins['Dealer'] += 1
  end
end

def found_game_winner?(ttl_wins)
  ttl_wins.value?(5)
end

# gameplay starts
# display_greeting

# loop do # main loop
#   total_wins = Hash.new(0) # mutated with Integer#+

#   loop do # match loop
#     deck = CARD_NAMES * 4
#     match_totals = Hash.new # updates when any cards are given
#     shuffling
#     hands = initialize_hand!(match_totals, deck)

#     player_turn!(total_wins, match_totals, deck, hands)
#     dealer_turn!(total_wins, match_totals, deck, hands)

#     clear_screen

#     winner, busts = determine_winner(match_totals)
#     update_match_wins!(total_wins, winner)
#     display_board(total_wins, match_totals, hands, true)
#     new_line
#     display_match_winner(winner, busts)
#     pause 1
#     break if found_game_winner?(total_wins)

#     new_line
#     prompt_yaml 'ready_for_next_match?'
#     gets
#   end

#   drumroll(total_wins)
#   pause 1

#   new_line
#   prompt_yaml 'play_again'
#   break unless gets.chomp.downcase.start_with?('y')
# end

# prompt_yaml 'goodbye'

# NEXT
# - add suit to cards

# - set SUITS to array of suit characters (unicode for fun?)
# - update deck for nested two element arrays (or hashes?)
# - update initialize_hand! to create 
# - update hands to use only card names
# - update display to use both elements
# - update determine_points to use only card names

# Deck, Option 3: # deck is suit specific, unnecessary for given requirements
# - Create constants:
#   - `SUITS`, an array which contains strings of `(spades, hearts, clubs. diamonds)` # DONE
#   - `VALUES`, an array which contains strings of `%w(2 3 4 5 6 7 8 9 10 jack queen king ace)` # DONE
#   - `WORTH`, a hash which contains how many points the values are worth `{2=>2, 3=>3, 4=>4, 5=>5, 6=>6, 7=>7, 8=>8, 9=>9, 10=>10, jack: 10, queen: 10, king: 10, ace: [1, 11]}` # DONE

# - Initialize a deck:
#   - Create a hash of 52 key-value pairs:
#     - Create strings by combining `SUITS` and `VALUES` with every combination (order does not matter)

# | Suit | Name | unicode num |
# | ---- | ---- | ----------- |
# | ♠ | Black Spade | &#9824; |
# | ♥ | Black Heart | &#9829; |
# | ♣ | Black Club | &#9827; |
# | ♦ | Black Diamond | &#9830; |
# | ♤ | White Spade | &#9828; |
# | ♡ | White Heart | &#9825; |
# | ♧ | White Club | &#9831; |
# | ♢ | White Diamond | &#9826; |
