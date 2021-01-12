class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  FARE_PRICE = 4
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
 
  end

  def top_up(amount)
    fail "Unable to top up as it would exceed balance limit (£#{MAXIMUM_BALANCE})" if (self.balance + amount) > MAXIMUM_BALANCE

    self.balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
    
  end

  def touch_out
    deduct(FARE_PRICE)
    self.entry_station = nil
  end

  def in_journey?
    !!entry_station
  end


private #-----------------------------

  attr_writer :balance, :entry_station
  attr_accessor :in_use
  def deduct(amount)
    self.balance -= amount
  end

end
