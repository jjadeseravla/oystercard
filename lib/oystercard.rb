require_relative './custom_errors'

class Oystercard
  attr_reader :balance, :in_journey

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(top_up_amount)
    raise(BalanceError, 'requested top-up amount exceeds limit!') if (@balance + top_up_amount) > MAX_BALANCE
    @balance += top_up_amount
  end

  def deduct(debit_amount)
    @balance -= debit_amount
  end

  def touch_in
    raise(BalanceError, 'balance is too low') if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
