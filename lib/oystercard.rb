require_relative './journey'

class OysterCard
  MAX_LIMIT = 90
  BALANCE = 0
  MINIMUM_FARE = 1

  attr_reader :balance,
              :max_limit,
              :in_journey

  def initialize(balance = BALANCE)
    @max_limit = MAX_LIMIT
    @balance = balance
    @in_journey = false
    @journey = Journey.new
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value > MAX_LIMIT
    @balance += value
  end

  def touch_in(station)
    raise "insufficient funds to complete journey" if @balance < MINIMUM_FARE
    deduct(@journey.fare) if @in_journey
    @journey.start_journey(station)
    @in_journey = true
  end

  def touch_out(station)
    deduct(@journey.fare)
    @journey.end_journey(station)
    @in_journey = false
  end

  private
    def deduct(value)
      raise "do not have enough money" if @balance < value
      @balance -= value
    end
end
