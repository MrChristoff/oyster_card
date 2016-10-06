require 'journeylog'

describe JourneyLog do

  subject(:log) { described_class.new }

  describe '#initialize' do
    it "has a journey history Array" do
      expect(log.journey_history).to eq([])
    end

end
