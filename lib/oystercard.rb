require_relative 'journey'
require_relative 'journey_log'
require_relative 'fare_calc'

class OysterCard
  MAX_LIMIT = 90
  BALANCE = 20

attr_reader :balance,
            :max_limit,
            :entry_station,
            :exit_station,
            :journey,
            :in_journey,
            :journey_history

  def initialize
    @max_limit = MAX_LIMIT
    @balance = BALANCE
    @in_journey = false
    @journey_history = []
  end

  def top_up(value)
    raise "balance cannot exceed #{@max_limit} pounds" if @balance + value > MAX_LIMIT
    @balance += value
  end

  def touch_in(entry_station)
    raise "insufficient funds to complete journey" if @balance < MINIMUM_FARE
    save_journey if @in_journey == true
    @journey = Journey.new
    @journey.start_journey(entry_station)
    @in_journey = true
  end

  def touch_out(exit_station)
    touch_out_journey
    @journey.end_journey(exit_station)
    @in_journey = false
    save_journey
  end

  def save_journey
    @journey_history << @journey
  end

  def touch_out_journey
    @journey = Journey.new if @in_journey == false
  end

  private
  def deduct(value)
    raise "do not have enough money" if @balance < value
    @balance -= value
  end
end
