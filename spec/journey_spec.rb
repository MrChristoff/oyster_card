require 'journey'

describe Journey do

  subject(:log) { described_class.new }

  before :each do
    @station = double(:station)
    allow(@station).to receive(:name).and_return('waterloo')
    allow(@station).to receive(:zone).and_return(1)
  end

  describe '#initialize' do
    it "has a journey history Array" do
      expect(log.journey_history).to eq([])
    end
  end

  describe '#start_journey' do
    it "appends station location and zone to current_journey" do
      log.start_journey(@station)
      expect(log.current_journey).to eq(['waterloo', 1])
    end
  end

  describe '#clear_current_journey' do
    it 'clears current journey array' do
      log.clear_current_journey
      expect(log.current_journey).to eq([])
    end
  end
end

