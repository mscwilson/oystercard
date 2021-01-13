require_relative "station"

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  FARE_PRICE = 4

  attr_reader :balance, :entry_station, :history

  def initialize
    @balance = 0
    @history = []
  end

  def top_up(amount)
    fail "Unable to top up as it would exceed balance limit (£#{MAXIMUM_BALANCE})" if (self.balance + amount) > MAXIMUM_BALANCE

    self.balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if balance < MINIMUM_BALANCE

    @entry_station = entry_station 
  end

  def in_journey?
    !!entry_station
  end

  def touch_out(exit_station)
    deduct(FARE_PRICE)
    history << {entry_station: entry_station, exit_station: exit_station } 
    self.entry_station = nil
  end

  private #-----------------------------

  attr_writer :balance, :entry_station

  def deduct(amount)
    self.balance -= amount
  end

end
