class Journey
  FINE = 6
  MINIMUM_FARE = 1
  attr_reader :current_journey
              :complete
              :in_journey

  def initialize(no_tuouch_in=false)
    @current_journey = []
    @complete = true
    @journey_counter = 0
  end


  def start_journey(station)
    # clear_current_journey
    @journey_counter += 1
    # @complete = false
    @current_journey << station
  end

  # def clear_current_journey
  #   @current_journey = []
  # end

  def end_journey(station)
    @current_journey << station
    @current_journey +=1
    @complete = true
  end

  # def fare
  #    MINIMUM_FARE
  # end
  #
  # def fine
  #   FINE
  # end

end
