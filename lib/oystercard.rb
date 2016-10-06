require_relative 'journey'

class OysterCard
  MAX_LIMIT = 90
  BALANCE = 0
  MINIMUM_FARE = 1

attr_reader :balance,
            :max_limit,
            :entry_station,
            :exit_station,
            :journey

  def initialize(balance = BALANCE)
    @max_limit = MAX_LIMIT
    @balance = balance
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value > MAX_LIMIT
    @balance += value
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(entry_station)
    raise "insufficient funds to complete journey" if @balance < MINIMUM_FARE
    @journey = Journey.new
    @journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    @journey.end_journey(exit_station)
    deduct(MINIMUM_FARE)
  end

  private
  def deduct(value)
    raise "do not have enough money" if @balance < value
    @balance -= value
  end
end
