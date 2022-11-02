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
    @transaction = Transaction.new(10.00)
    # adjust setup accordingly
  end

  # tests go here
end