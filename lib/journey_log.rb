require_relative 'journey'

class JourneyLog

    attr_reader :journey_history

  def initialize
    @journey_history = []
  end

  def new_journey(station)
    @new_journey = Journey.new
    @new_journey.start_journey(station)
  end

  def end_journey(station)
    @new_journey.end_journey(station)
    journey_history_update
  end

  def journey_history_update
    @journey_history << @new_journey.current_journey
    @journey_history
  end

end
