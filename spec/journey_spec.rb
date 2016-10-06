require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:station) {double :station}

  # before :each do
  #   @start_array = ['waterloo', 1]
  #   @end_array = ['waterloo', 1, 'wembley', 4]
  #   @station2 = double(:station2)
  #   allow(@station).to receive(:name).and_return('waterloo')
  #   allow(@station).to receive(:zone).and_return(1)
  #   allow(@station2).to receive(:name).and_return('wembley')
  #   allow(@station2).to receive(:zone).and_return(4)
  # end

    it "has a journey history Array" do
      expect(journey.journey_history).to eq([])
    end

    it "appends start station" do
      expect(journey.start_journey(station)).to eq [station]
    end

  it "appends exit station location" do
    journey.start_journey(station)
    journey.end_journey(station)
    expect(journey.current_journey).to eq [station, station]
  end

  it 'clears current journey array' do
    journey.clear_current_journey
    expect(journey.current_journey).to eq([])
  end

  it 'returns penalty fare if journey is incomplete' do
    expect(journey.fine).to eq Journey::FINE
  end

  it 'returns normal fare when journey is complete' do
      expect(journey.fare).to eq Journey::MINIMUM_FARE
  end
end
