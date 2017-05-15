require_relative './custom_errors'

class Oystercard
  attr_reader :balance, :in_journey, :entry_station, :list_of_journeys

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 4

  def initialize(balance = DEFAULT_BALANCE)
    @list_of_journeys = []
    @balance = balance
    @entry_station = nil
  end

  def top_up(top_up_amount)
    raise(BalanceError, 'requested top-up amount exceeds limit!') if (@balance + top_up_amount) > MAX_BALANCE
    @balance += top_up_amount
  end

  def deduct(debit_amount)
    @balance -= debit_amount
  end

  def touch_in(entry_station)
    raise(BalanceError, 'balance is too low') if @balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @balance -= MIN_FARE
    @entry_station = nil
  end

end
