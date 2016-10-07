require 'oystercard'

describe OysterCard do

  subject(:card) {described_class.new}
  let (:station1) {double :station1}
  let (:station2) {double :station2}

  # before do
  #   @top_up_value = 10
  #   @max_top_up = 90
  #   @deduct_value = 1
  #   allow(station).to receive(:in_journey).and_return(false)
  #   allow(station).to receive(:in_journey).and_return(true)
  #   allow(station).to receive(:name).and_return('wembley')
  #   allow(station).to receive(:zone).and_return(4)
  # end

  it "has a journey history" do
    expect(card).to respond_to(:journey_history)
  end


  context 'card is topped up' do
    before do
      card.top_up(OysterCard::MAX_LIMIT)
    end

    it 'adds top-up to balance' do
      expect(card.balance).to eq OysterCard::MAX_LIMIT
    end

    it 'raises an error if balance is more than 90' do
      expect {card.top_up(OysterCard::MAX_LIMIT)}.to raise_error "balance cannot exceed #{OysterCard::MAX_LIMIT} pounds"
    end

  end

  context " #touch_in" do

    it 'touch_in raises an error if minimum fare not met' do
      expect{card.touch_in(station1)}.to raise_error "insufficient funds to complete journey"
    end


    it "creates a new journey" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_in(station1)
      expect(card.journey).not_to be nil
    end

    it " Pushes station to current journey" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_in(station1)
      expect(card.journey.current_journey).to eq [station1]
    end

    it " in journey is true" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_in(station1)
      expect(card.in_journey).to eq true
    end

    # we expect touch_in twice to log and deduct penalty from previous journey.
    # and log current journey as normal

    it "has the second station after two touch_in events" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_in(station1)
      card.touch_in(station2)
      expect(card.journey_history.last.current_journey).to eq [station1]
    end

    it " records normal journey after two touch_in events" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_in(station1)
      card.touch_in(station2)
      card.touch_in(station1)
      card.touch_out(station2)
      expect(card.journey_history.last.current_journey).to eq [station1, station2]
    end

  end

  context " #touch_out" do

    it "pushes station to current journey" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_in(station1)
      card.touch_out(station2)
      expect(card.journey.current_journey).to eq [station1, station2]
    end

    it " in journey is true" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_in(station1)
      card.touch_out(station2)
      expect(card.in_journey).to eq false
    end

    it "journey history is updated after touch_in, touch_out" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_in(station1)
      card.touch_out(station2)
      expect(card.journey_history.last).to eq (card.journey)
    end

    it "journey history is updated after touch_out without touch_in" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_out(station1)
      expect(card.journey_history.last).to eq (card.journey)
    end

    it "normal journey history is updated after touch_out without touch_in" do
      card.top_up(OysterCard::MINIMUM_FARE)
      card.touch_out(station1)
      card.touch_in(station1)
      card.touch_out(station2)
      expect(card.journey_history.last).to eq (card.journey)
    end

  end

end
