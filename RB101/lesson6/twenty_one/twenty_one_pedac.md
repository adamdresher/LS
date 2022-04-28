## Understanding the Problem
Build a game called Twenty-One, a simplified version of blackjack (no splits, double downs, etc).

##### Rules of Twenty-One
- Game starts with a normal 52-card deck consisting of:
  - 4 suits (hearts, diamonds, clubs, and spades)
  - 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace)
- The goal of Twenty-One is to try to get as close to 21 as possible, without going over
  - If player goes over 21, player 'busts' and loses
- Setup:
  - The game consists of a dealer' and a 'player'
  - Both participants are initially dealt 2 cards
  - The player can see both of her/his 2 cards, but only one of the dealer's cards
- Card values:
  - All of the card values are pretty straightforward, except for the ace
  - Cards numbered 2 through 10 are worth their face value
  - Jack, queen, and king are each worth 10
  - Ace can be worth 1 or 11
    - An ace's value is determined each time a new card is drawn from the deck
      - Ex.1, if a hand contains a 2, an ace, and a 5, then the total value of the hand is 18 (2 + 11 + 5)
        - ace is 11
      - Ex. 2, if a second ace is drawn, the program must determine the value of both aces
        - If both aces are worth 11 (2 + 11 + 5 + 11), 21 is exceeded
          - One ace can remain 11, but one must be worth 1 (2 + 11 + 5 + 1), the hand is worth 19
      - Ex.3, if the player continues to 'hit' and draw aces, the aces are reevaluated each time
        - This can result in all four aces having a value of 1 each (1, 3, 5, 1, 1, 1), the hand is worth 12
        - The first ace cannot remain 11 (11, 3, 5, 1, 1, 1), the hand is worth 22
- Player turn:
  - The player goes first
    - Can decide to either 'hit' or 'stay'
      - Hit means the player will ask for another card
        - Exceeding 21 results in a 'bust' and loss
  - The player can continue to hit as many times as s/he wants
  - The turn is over when the player either busts or stays
  - If the player busts, the game is over and the dealer wins
- Dealer turn:
  - When the player stays, it's the dealer's turn
  - The dealer must follow strict rules for determining whether to 'hit' or 'stay'
    - 'Hit' until the total is at least 17
    - If the dealer 'busts', then the player wins
- Comparing cards:
  - When both the player and the dealer 'stay', it's time to compare the total value of the cards and see who has the highest value

**Explicit Requirements:**

- The goal of the game is to end with a higher number of points than the opponent
  - collecting more than 21 points results in game loss
- Points are gained by collecting cards
  - can collect as many cards as desired until points > 21
- Use a deck of 52 cards (4 suits of 13 cards)
  - each suit contains the cards 2..10, jack, queen, king, ace
- Each card represents a point value
  - 2..10 are worth self based on integer representation
  - jack, queen, and king are worth 10
  - ace can be worth 1 or 11
    - ace's worth is determined by program
    - program should optimize ace's worth to reduce chance of losing
- Cards are given in a random order
  - Both player and dealer start with 2 cards
  - One of dealer's cards are hidden from user
- A player's turn has two options: 'hit' or 'stay'
  - 'hit' means to collect another card
    - player loses if collecting another card results in points > 21 ('bust')
  - 'stay' means to end turn
- The dealer's turn has two options: 'hit' or 'stay'
  - dealer must 'hit' until its points > 16
    - dealer loses if collecting another card results in points > 21
  - dealer must 'stay' if its points > 16
- If both player and dealer 'stay', points are compared to determine a winner


**Implicit requirements:**

- Does the user ever see the dealer's hidden card?
    - The hidden card can be revealed at the beginning of the dealer's turn.
- Should game rules be explained to user?
    - Give an option to display the rules at any time by pressing a button (`h` for help).
- Should the user be asked to play again?
    - Not required, but can be implemented after main gameplay is established.
- Should a scoreboard be kept for multiple games?
    - Multiple games are not required, but can be implemented if 'play again' feature is added.
- How is the ace's point value determined?
    - if 11 results in the total points being 21 or less
      - ace == 11
    - else
      - ace == 1
- How are multiple aces' point values determined?
    - if there are two or more aces
      - if first ace == 11 && all other aces == 1 results in the total points being 21 or less
        - first ace == 11 && all other aces == 1
      - else
        - all aces == 1

**Mental Model:**

- Welcome user to the card game, Twenty-One.  Explain the game's rules and ask user to press any key to continue.  Then initialize a game between user (aka, player) and computer (aka, dealer) by creating a deck of cards with associated values.
  
  Pass 2 cards at random to both player and dealer.  Player's cards are visible, but only one of the dealer's cards are visible to player.
  
  Player starts first.  Player can choose to 'hit' or 'stay'.  If player chooses 'hit', calculate player's points.  If player's points are above 21, player 'busts' (show dealer's hidden card).  If not, start player's turn again.  If player chooses 'stay', player's turn ends.
  
  Next is dealer's turn.  Dealer reveals hidden card.  If dealer's points are below 17, dealer `hits`.  If dealer's points are above 21, dealer 'busts'.  If not, start dealer's turn again.  If dealer chooses 'stay', dealer's turn ends.
  
  If neither player and dealer have 'busted', sum both hands and declare a winner.  Ask player if s/he would like to play again.  If yes, initialize a new deck and begin a new game.  If no, say goodbye.

---
### Examples/Tests
```ruby
# Format for ongoing game
Dealer has: 7 and unknown card
You have: 10 and 7

Dealer has: 5 and unknown card
You have: Jack and 6
```
---
### Data Structures
Constants:
`CARD_NAMES` - names of each card
- Array

`WORTH` - keys are card names, values are card's point value
- Hash

Deck:
- Array

Player's/Dealer's hand:
- Arrays

<!-- Scoreboard:
- Array -->

---
### Algorithm
1. Initialize a deck:
2. Pass out cards:
  - give player two cards, 'face up'
  - give dealer two cards, one 'face up' and another 'face down' (hidden)
3. Player's turn:
  - player 'hit' or 'stay'
  - repeat Step 3 unless player 'busts' or 'stays'
4. If player 'busts', dealer wins
5. Dealer's turn:
  - show 'face down' card
  - dealer 'hit' if hand is < 16
  - repeat Step 4 until hand is >= 17
6. If dealer busts, player wins
7. If no busts, compare hands and declare the winner
8. Play again?
  - return to Step 1 if 'yes'
  - goodbye!

Deck: # deck is not suit specific
- create constants:
  - `CARD_NAMES`, an array of strings for eacy card value
    - `(2, 3 jack, queen, ace, etc.)`
  - `WORTH`, a hash with a key for each string in CARD_NAMES and value associated based on how many points each is worth
    - `{2=>2, 3=>3, jack: 10, queen: 10, ace: [1, 11], etc}`
- initialize a `deck`:
  - create an array and fill it with 4 copies of `CARD_NAMES`
  - randomize elements' order

<!-- Deck, Option 2: # deck is suit specific, unnecessary for given requirements
- Initialize a deck:
  - Create an array of 4 hashes:
    - `(spades, hearts, clubs. diamonds)`
  - For each nested hash, create 13 key value pairs:
    - keys are `%w(2 3 4 5 6 7 8 9 10 jack queen king ace)`
      - keys' integer representation is assigned as the value for `%w(2 3 4 5 6 7 8 9 10`
      - `10` is assigned as the value for `%w(jack queen king ace)`
      - `1` and `11` are assigned as values for `(ace)`

Deck, Option 3: # deck is suit specific, unnecessary for given requirements
- Create constants:
  - `SUITS`, an array which contains strings of `(spades, hearts, clubs. diamonds)`
  - `VALUES`, an array which contains strings of `%w(2 3 4 5 6 7 8 9 10 jack queen king ace)`
  - `WORTH`, a hash which contains how many points the values are worth `{2=>2, 3=>3, 4=>4, 5=>5, 6=>6, 7=>7, 8=>8, 9=>9, 10=>10, jack: 10, queen: 1
0, king: 10, ace: [1, 11]}`
- Initialize a deck:
  - Create a hash of 52 key-value pairs:
    - Create strings by combining `SUITS` and `VALUES` with every combination (order does not matter) -->

Player's/Dealer's hand:
- initialize `player_hand`/`dealer_hand` set to an empty array:
- repeat twice: # dealing fairly
  - remove a card from `deck`
  - pass card from `deck` to player_hand
  - remove a card from `deck`
  - pass card from `deck` to dealer_hand

---
### Code
```ruby
CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)
WORTH = {'2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9, '10'=>10, 'jack'=>10, 'queen'=>10, 'king'=>10, 'ace'=>[1, 11]}
deck = CARD_NAMES * 4
player_hand = []
dealer_hand = []

# pases out initial hand
2.times { deck.shuffle! }
2.times do
  player_hand << deck.pop
  dealer_hand << deck.pop
end

# determining a hand's worth:
# does not handle aces
player_hand.map { |card| WORTH[card] }.sum
dealer_hand.map { |card| WORTH[card] }.sum
```
