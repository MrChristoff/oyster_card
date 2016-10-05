class Journey

  attr_reader :journey_history,
              :current_journey

  def initialize
    @journey_history = []
  end

  def start_journey(station)
    clear_current_journey
    @current_journey << station.name
    @current_journey << station.zone
  end

  def clear_current_journey
    @current_journey = []
  end

  def end_journey(station)
    @current_journey << station.name
    @current_journey << station.zone
  end


end
