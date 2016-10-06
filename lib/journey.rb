class Journey

  attr_reader :journey_history,
              :current_journey

  def initialize
    @journey_history = []
    @current_journey = []
  end

  def start_journey(station)
    clear_current_journey
    @current_journey << station
  end

  def clear_current_journey
    @current_journey = []
  end

  def end_journey(station)
    @current_journey << station
    journey_history_update
  end

  def journey_history_update
    @journey_history << @current_journey.dup
    @journey_history
  end

  def fare
    if @current_journey.length < 4
      6
    else
      1
    end
  end

end
