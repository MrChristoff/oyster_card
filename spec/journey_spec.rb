require 'journey'

describe Journey do

  subject(:log) { described_class.new }

  describe '#initialize' do
    it "has a journey history Array" do
      expect(log.journey_history).to eq([])
    end

    it "has a current journey Array" do
      expect(log.current_journey).to eq([])
    end
  end


end
