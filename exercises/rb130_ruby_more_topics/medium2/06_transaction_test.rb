require 'SimpleCov'
SimpleCov.start

require 'Minitest/autorun'
require 'Minitest/reporters'

Minitest::Reporters.use!

require_relative '01_transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(10.00)
  end

  def test_prompt_for_payment_over
    input = StringIO.new("20\n")
    
    assert_output(/You owe \$10.00./) do
      @transaction.prompt_for_payment(input: input)
    end
    assert_equal(20.00, @transaction.amount_paid)

    input.close
  end

  def test_prompt_for_payment_exact
    input = StringIO.new("10\n")

    assert_output(/You owe \$10.00/) do
      @transaction.prompt_for_payment(input: input)
    end
    assert_equal(10.00, @transaction.amount_paid)

    input.close
  end

  def test_prompt_for_payment_under
    input = StringIO.new("1\n10\n")

    assert_output(/This is not the correct amount./) do
      @transaction.prompt_for_payment(input: input)
    end
    assert_equal(10.00, @transaction.amount_paid)

    input.close
  end
end
