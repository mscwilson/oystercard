class Oystercard

  MAXIMUM_BALANCE = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Unable to top up as it would exceed balance limit (£#{MAXIMUM_BALANCE})" if (self.balance + amount) > MAXIMUM_BALANCE

    self.balance += amount
  end

  def deduct(amount)
    self.balance -= amount
  end

private #-----------------------------

  attr_writer :balance

end
