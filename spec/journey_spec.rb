require 'journey'

describe Journey do

  subject(:log) { described_class.new }

  before :each do
    @start_array = ['waterloo', 1]
    @end_array = ['waterloo', 1, 'wembley', 4]
    @station = double(:station)
    @station2 = double(:station2)
    allow(@station).to receive(:name).and_return('waterloo')
    allow(@station).to receive(:zone).and_return(1)
    allow(@station2).to receive(:name).and_return('wembley')
    allow(@station2).to receive(:zone).and_return(4)
  end

  describe '#initialize' do
    it "has a journey history Array" do
      expect(log.journey_history).to eq([])
    end
  end

  describe '#start_journey' do
    it "appends start station location and zone to current_journey" do
      log.start_journey(@station)
      expect(log.current_journey).to eq(@start_array)
    end
  end

  describe '#clear_current_journey' do
    it 'clears current journey array' do
      log.clear_current_journey
      expect(log.current_journey).to eq([])
    end
  end

  describe '#end_journey' do
    before do
      log.start_journey(@station)
      log.end_journey(@station2)
    end

    it "appends exit station location and zone to current_journey" do
      expect(log.current_journey).to eq(@end_array)
    end
  end
end
