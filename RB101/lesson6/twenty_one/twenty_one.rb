require 'yaml'

MESSAGES = YAML.load_file('twenty_one_messages.yml')
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
  print " #{msg[1]}!"
  sleep 1
  new_line
end

def shuffling
  pause(20, ['Shuffling ', 'FINISHED'], true)
end

def drumroll(ttl_mtch)
  prompt 'Drumroll please!'
  pause(20, ['And the winner is ', "the #{ttl_mtch.key(5)}"], true)
  puts ""
end

def initialize_deck
  CARD_NAMES * 4
end

def initialize_hand!(total, dck)
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

def draw_card!(dck)
  dck.pop
end

def display_greeting
  clear_screen
  new_line 6
  prompt_yaml_ 'welcome'
  new_line
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

def display_board(ttl_mtch, total, playr_hnd, dealr_hnd, reveal_dealr_crd=false)
  new_line
  puts "   Scoreboard: You - #{ttl_mtch['Player']}, \
Dealer - #{ttl_mtch['Dealer']}"
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
    pause 1
  end
  choice
end

def player_draws!(total, dck, playr_hnd)
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
      player_draws!(total, dck, playr_hnd)
      pause 0.5
    elsif choice == 's'
      prompt_yaml 'player_stay'
      pause 0.5
      break

    end
  end
end

def dealer_draws!(dck, total, dealr_hnd)
  prompt_yaml 'dealer_draw'
  pause 1
  new_line
  new_card = draw_card!(dck)
  prompt "Dealer receives a #{new_card}."
  dealr_hnd << new_card

  update_points!(dealr_hnd, total, :dealer_points)
end

def dealer_turn!(ttl_mtch, total, dck, playr_hnd, dealr_hnd)
  return if someone_busts?(total[:player_points])

  loop do
    break if someone_busts?(total[:dealer_points])

    clear_screen
    display_board(ttl_mtch, total, playr_hnd, dealr_hnd, true)
    new_line
    prompt_yaml 'dealer_turn'

    if total[:dealer_points] < DEALER_STAYS
      dealer_draws!(dck, total, dealr_hnd)
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

def update_points!(hnd, total, current_turn)
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
  total[current_turn] = hand_val.sum
end

def someone_busts?(total)
  total > SCORE_LIMIT
end

def determine_winner(total)
  total_playr_pnts = total[:player_points]
  total_dealr_pnts = total[:dealer_points]

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

def update_match_wins!(ttl_mtch, winner)
  if winner == :player
    ttl_mtch['Player'] += 1
  elsif winner == :dealer
    ttl_mtch['Dealer'] += 1
  end
end

def found_game_winner?(ttl_mtch)
  ttl_mtch.value?(5)
end

# gameplay starts
display_greeting

loop do # main loop
  total_matches = Hash.new(0) # mutated with Integer#+

  loop do # match loop
    deck = CARD_NAMES * 4
    total = Hash.new # updates when any cards are given
    shuffling
    player_hand, dealer_hand = initialize_hand!(total, deck)

    player_turn!(total_matches, total, deck, player_hand, dealer_hand)
    dealer_turn!(total_matches, total, deck, player_hand, dealer_hand)

    clear_screen

    winner, busts = determine_winner(total)
    update_match_wins!(total_matches, winner)
    display_board(total_matches, total, player_hand, dealer_hand, true)
    new_line
    display_match_winner(winner, busts)
    pause 1
    break if found_game_winner?(total_matches)

    new_line
    prompt_yaml 'ready_for_next_match?'
    gets
  end

  drumroll(total_matches)
  pause 1

  new_line
  prompt_yaml 'play_again'
  break unless gets.chomp.downcase.start_with?('y')
end

prompt_yaml 'goodbye'
