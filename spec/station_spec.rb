require 'station'

describe Station do

  subject(:station) { described_class.new("wembley", 4) }

  before :each do

  end


  it "creates an isntance of the Station class" do
    expect(subject.is_a?(Station)).to eq(true)
  end

  it "saves the name on instantiation" do
    expect(station.name).to eq("wembley")
  end

  it "saves the zone on instantiation" do
    expect(station.zone).to eq(4)
  end


end
