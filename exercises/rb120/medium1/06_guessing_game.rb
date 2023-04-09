class GuessingGame
  GUESSING_RANGE = (1..100).to_a

  def initialize
    @target_num = GUESSING_RANGE.sample
    @num_of_guesses = 7
    @guess = nil
  end

  def play
    system 'clear'

    loop do
      display_guesses_remaining
      self.num_of_guesses -= 1
      request_user_guess
      display_feedback
      break if correct_guess? || num_of_guesses.zero?
    end

    display_results
  end

  private

  attr_reader :target_num
  attr_accessor :guess, :num_of_guesses

  def display_guesses_remaining
    guesses = (num_of_guesses == 1) ? 'guess' : 'guesses'

    puts "You have #{num_of_guesses} #{guesses} remaining."
  end

  def request_user_guess
    loop do
      display_guess_request
      self.guess = gets.to_i
      break if valid_guess?
      display_invalid_guess
    end
  end

  def display_guess_request
    print "Enter a number between 1 and 100: "
  end

  def valid_guess?
    GUESSING_RANGE.include? guess
  end

  def display_invalid_guess
    print "Invalid guess. "
  end

  def display_feedback
    puts case guess
         when 1...target_num        then "Your guess is too low."
         when (target_num + 1)..100 then "Your guess is too high."
         else                            "That's the number!"
         end
    puts
  end

  def correct_guess?
    guess == target_num
  end

  def display_results
    results = correct_guess? ? "You win!" : "You have no more guesses. You lost!"

    puts results
  end
end

game = GuessingGame.new
game.play

=begin
# Example of expected gameplay:

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end