class Journey
  FINE = 6
  MINIMUM_FARE = 1
  attr_reader :journey_history,
              :current_journey
              :complete

  def initialize
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
    @complete = true
  end

  def fare
     MINIMUM_FARE
  end

  def fine
    FINE
  end

end
