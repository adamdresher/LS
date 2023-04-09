# =begin
class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0
      success = (self.balance -= amount) # self.balanace = balance - amount
    else
      success = false
    end

    if success
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    if valid_transaction?(new_balance)
      @balance = new_balance
      true
    else
      false
    end
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).
                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50
# =end

=begin
`#withdraw` has an unexpected return due to how `#valid_transaction?` is
implemented.  `#deposit` and `#withdraw` have different requirements for a valid
argument, however both use the same implementation of `#valid_transaction?`
`#deposit` doesn't require validation beyond checking its argument is greater
than `0`.  However `#withdraw` requires checking if the amount is both greater
than `0` and less than `@balance`.
To resolve this issue, `#valid_transaction?` should be redefined to vaidate
`#withdraw`'s argument directly by adding a condition `balance >= new_balance`
(or simply refactoring it to the expression `balance - new_balance >= 0`).
This works well as `#valid_transaction?` returns a `Boolean`.  We can refactor
this more by simplyifying `#balance=()` to `@balance = new_balance`.  As this
expression always returns a numeric object (`Integer` or `Float`), it will
always evaluate to `true`.  The implicit truthiness is determine `success`.
Finally `#valid_transaction?` and its argument `new_balance` could be renamed to
better express their behaviors.
=end

class BankAccount

  # ...

  def withdraw(amount)
    if valid_withdrawal?(amount)
      self.balance -= amount
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  private

  def balance=(new_balance)
      @balance = new_balance
  end

  def valid_withdrawal?(amount)
   balance - amount >= 0
  end
end
