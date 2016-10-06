require_relative 'journey'
require_relative 'journey_log'
require_relative 'fare_calc'

class OysterCard
  MAX_LIMIT = 90
  BALANCE = 20

attr_reader :balance

  def initialize
    @max_limit = MAX_LIMIT
    @balance = BALANCE
    @in_journey = false
    @journey_log = JourneyLog.new
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value > MAX_LIMIT
    @balance += value
  end

  def touch_in(station)
    raise "insufficient funds to complete journey" if @balance < Journey::MINIMUM_FARE
    @journey_log.new_journey(station)
    # @in_journey == true ? deduct(@journey_log.new_journey(station).fine) : deduct(@journey_log.new_journey(station).fare)
    @in_journey = true
  end

  def touch_out(station)
    @journey_log.end_journey(station)
    @in_journey = false
  end

  private
  def deduct(value)
    raise "do not have enough money" if @balance < value
    @balance -= value
  end
end
