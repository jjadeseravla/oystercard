require_relative './custom_errors'

class Oystercard
  attr_reader :balance, :entry_station, :list_of_journeys

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

  def touch_in_at(station)
    raise(BalanceError, 'balance is too low') if @balance < MIN_BALANCE
    @entry_station = station
    @list_of_journeys << { entry_station: station }
  end

  def touch_out_at(station)
    @balance -= MIN_FARE
    @list_of_journeys.last[:exit_station] = station
    @entry_station = nil
  end

  def journeys
    puts @list_of_journeys
  end

end
