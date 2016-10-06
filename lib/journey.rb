class Journey
  FINE = 6
  MINIMUM_FARE = 1
  attr_reader :journey_history,
              :current_journey
              :complete

  def initialize
    @journey_history = []
    @current_journey = []
    @complete = true
  end

  def start_journey(station)
    clear_current_journey
    @complete = false
    @current_journey << station
  end

  def clear_current_journey
    @current_journey = []
  end

  def end_journey(station)
    @current_journey << station
    journey_history_update
    @complete = true
  end

  def journey_history_update
    @journey_history << @current_journey.dup
    @journey_history
  end

  def fare
     MINIMUM_FARE
  end

  def fine
    FINE
  end

end
