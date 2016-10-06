require 'journey_log'

describe JourneyLog do

  subject(:log) { described_class.new }
  let(:station) { double :station }

  it "has a journey history Array" do
    expect(log.journey_history).to eq([])
  end

  it " appends journey history array with entry and exit station " do
    log.new_journey(station)
    log.end_journey(station)
    expect(log.journey_history).to eq([[station, station]])
  end

end
