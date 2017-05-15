require_relative './custom_errors'

class Oystercard
  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(top_up_amount)
    raise(BalanceError, 'requested top-up amount exceeds limit!') if (@balance + top_up_amount) > MAX_BALANCE
    @balance += top_up_amount
  end

  def deduct(debit_amount)
    @balance -= debit_amount
  end

end
