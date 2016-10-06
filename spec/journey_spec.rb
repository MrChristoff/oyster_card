require 'journey'

describe Journey do

  subject(:log) { described_class.new }
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
      expect(log.journey_history).to eq([])
    end

    it "appends start station" do
      expect(log.start_journey(station)).to eq [station]
    end

  it "appends exit station location" do
    log.start_journey(station)
    log.end_journey(station)
    expect(log.current_journey).to eq [station, station]
  end

  it 'clears current journey array' do
    log.clear_current_journey
    expect(log.current_journey).to eq([])
  end
end
