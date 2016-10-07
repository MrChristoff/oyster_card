require_relative 'journey'

class OysterCard
  MAX_LIMIT = 90
  BALANCE = 0
  MINIMUM_FARE = 1

attr_reader :balance,
            :max_limit,
            :entry_station,
            :exit_station,
            :journey,
            :in_journey

  def initialize(balance = BALANCE)
    @max_limit = MAX_LIMIT
    @balance = balance
    @in_journey = false
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value > MAX_LIMIT
    @balance += value
  end

  def touch_in(entry_station)
    raise "insufficient funds to complete journey" if @balance < MINIMUM_FARE
    @journey = Journey.new
    # @in_journey == true ? deduct(journey.fine) : deduct(journey.fare)
    @journey.start_journey(entry_station)
    @in_journey = true
  end

  def touch_out(exit_station)
    @journey.end_journey(exit_station)
    @in_journey = false
  end

  private
  def deduct(value)
    raise "do not have enough money" if @balance < value
    @balance -= value
  end
end
