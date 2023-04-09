require 'simplecov'
SimpleCov.start

require 'Minitest/autorun'
require 'Minitest/reporters'
Minitest::Reporters.use!

require_relative '01_cash_register'
require_relative '01_transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(0.00)
    @transaction_10_00 = Transaction.new(10.00)
  end

  def test_accept_money
    @transaction_10_00.amount_paid = 10.00
    accepted_amount = @cash_register.accept_money(@transaction_10_00)
    resulting_amount = @cash_register.total_money

    assert_equal(10.00, accepted_amount)
    assert_equal(10.00, resulting_amount)
  end

  def test_change
    @transaction_10_00.amount_paid = 20.00
    transaction_change = @cash_register.change(@transaction_10_00)

    assert_equal(10, transaction_change)
  end
end
