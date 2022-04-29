require 'yaml'

MESSAGES = YAML.load_file('twenty_one_messages.yml')

SUITS = [[9828].pack('U*'), [9825].pack('U*'),
         [9831].pack('U*'), [9826].pack('U*')]
CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
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

def prompt_yaml_centered(msg)
  puts MESSAGES[msg].center(80)
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

def drumroll(total_wins)
  prompt 'Drumroll please!'
  pause(20, ['And the winner is ', "the #{total_wins.key(5)}"], true)
  puts ""
end

def initialize_deck
  CARD_NAMES.product(SUITS)
end

def initialize_hand!(match_totals, deck)
  hands = { playr: [], dealr: [] }

  2.times { deck.shuffle! }
  2.times do
    hands[:playr] << draw_card!(deck)
    hands[:dealr] << draw_card!(deck)
  end

  update_points!(hands[:playr], match_totals, :playr_points)
  update_points!(hands[:dealr], match_totals, :dealr_points)

  hands
end

def draw_card!(deck)
  deck.pop
end

def create_cards(cards)
  cards.map { |card| "#{card[0]} of #{card[1]}" }
end

def create_first_card(card)
  "#{card[0]} of #{card[1]}"
end

def display_greeting
  clear_screen
  new_line 6
  prompt_yaml_centered 'welcome'
  new_line
  print SUITS.join('  ').center(80)
  new_line(2)
end

def display_rules
  prompt_yaml_centered 'rules0'
  new_line
  prompt_yaml_centered 'rules1' # should figure out how to add variables to yaml
  puts "  Win a hand/match by getting as close to #{SCORE_LIMIT} \
as possible without going over."
  prompt_yaml_centered 'rules3'
  new_line
  prompt_yaml_centered 'rules4'
  new_line 2
  prompt_yaml_centered 'rules5'
  gets
end

def display_scoreboard(total_wins)
  new_line
  puts "   \
Scoreboard: You - #{total_wins['Player']}, Dealer - #{total_wins['Dealer']}"
  puts MESSAGES['line']
end

def display_hands(match_totals, hands, reveal_dealr=false)
  prompt "You have: \
#{joinor(create_cards(hands[:playr]))} (#{match_totals[:playr_points]} points)"

  if reveal_dealr
    prompt "Dealer has: \
#{joinor(create_cards(hands[:dealr]))} (#{match_totals[:dealr_points]} points)"
  else
    prompt "Dealer has: \
#{create_first_card(hands[:dealr].first)} and an unknown card"
  end
end

def display_board(total_wins, match_totals, hands, reveal_dealr=false)
  display_scoreboard(total_wins)
  display_hands(match_totals, hands, reveal_dealr)
end

def joinor(hand)
  if hand.size == 2
    hand.join(' & ')
  elsif hand.size >= 3
    hand[0..-2].join(', ') + ', & ' + hand[-1].to_s
  end
end

def valid_choice?(word, choice)
  word.start_with?(choice)
end

def choose_turn(total_wins, match_totals, hands)
  clear_screen
  display_board(total_wins, match_totals, hands)
  new_line
  prompt_yaml 'player_turn'
  prompt_yaml 'draw_or_stay'
  choice = gets.downcase.tr(' ', '')
end

def player_draws!(match_totals, deck, playr_hand)
  new_card = draw_card!(deck)
  prompt "Player receives a #{create_first_card(new_card)}."
  playr_hand << new_card

  update_points!(playr_hand, match_totals, :playr_points)
end

def player_turn!(total_wins, match_totals, deck, hands)
  loop do
    break if someone_busts?(match_totals[:playr_points])

    choice = choose_turn(total_wins, match_totals, hands)
    if valid_choice?(choice, 'd')
      player_draws!(match_totals, deck, hands[:playr])
      pause 0.5
    elsif valid_choice?(choice, 's')
      prompt_yaml 'player_stay'
      pause 0.5
      break
    else
      prompt_yaml 'draw_or_stay_validation'
      pause 1
    end
  end
end

def dealer_draws!(deck, match_totals, dealr_hand)
  prompt_yaml 'dealer_draw'
  pause 1
  new_line
  new_card = draw_card!(deck)
  prompt "Dealer receives a #{create_first_card(new_card)}."
  dealr_hand << new_card

  update_points!(dealr_hand, match_totals, :dealr_points)
end

def dealer_turn!(total_wins, match_totals, deck, hands)
  return if someone_busts?(match_totals[:playr_points])

  loop do
    break if someone_busts?(match_totals[:dealr_points])

    clear_screen
    display_board(total_wins, match_totals, hands, true)
    new_line
    prompt_yaml 'dealer_turn'

    if match_totals[:dealr_points] < DEALER_STAYS
      dealer_draws!(deck, match_totals, hands[:dealr])
    else
      prompt_yaml 'dealer_stay'
      break
    end
    pause 1
  end
end

# aces are calculated last to ensure their values can be properly
def aces_go_last(hand)
  hand.each_with_object([]) do |card, new_hand|
    card[0] == 'ace' ? new_hand.append(card) : new_hand.prepend(card)
  end
end

def update_points!(hand, match_totals, current_turn)
  hand_val = []
  hand = aces_go_last(hand)

  hand.flat_map do |card|
    hand_val << if card[0] == 'ace'
                  if hand_val.sum > (SCORE_LIMIT - 11)
                    WORTH[card[0]][0]
                  else
                    WORTH[card[0]][1]
                  end
                else
                  WORTH[card[0]][0]
                end
  end
  match_totals[current_turn] = hand_val.sum
end

def someone_busts?(match_totals)
  match_totals > SCORE_LIMIT
end

def determine_winner(match_totals)
  total_playr_pnts = match_totals[:playr_points]
  total_dealr_pnts = match_totals[:dealr_points]

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

def update_match_wins!(total_wins, winner)
  if winner == :player
    total_wins['Player'] += 1
  elsif winner == :dealer
    total_wins['Dealer'] += 1
  end
end

def found_game_winner?(total_wins)
  total_wins.value?(5)
end

# gameplay starts
display_greeting
display_rules

loop do # main loop
  total_wins = Hash.new(0) # mutated with Integer#+

  loop do # match loop
    deck = initialize_deck
    match_totals = Hash.new # updates when any cards are given
    shuffling
    hands = initialize_hand!(match_totals, deck)
    player_turn!(total_wins, match_totals, deck, hands)
    dealer_turn!(total_wins, match_totals, deck, hands)

    clear_screen

    winner, busts = determine_winner(match_totals)
    update_match_wins!(total_wins, winner)
    display_board(total_wins, match_totals, hands, true)
    new_line
    display_match_winner(winner, busts)
    pause 1
    break if found_game_winner?(total_wins)

    new_line
    prompt_yaml 'ready_for_next_match?'
    gets
  end

  drumroll(total_wins)
  pause 1

  new_line
  prompt_yaml 'play_again'
  break unless gets.chomp.downcase.start_with?('y')
end

prompt_yaml 'goodbye'
