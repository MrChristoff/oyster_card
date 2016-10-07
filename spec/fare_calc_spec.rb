require 'fare_calc'

describe FareCalc do
  subject(:fare) {described_class.new}

  it "has a minimum fare value" do
    expect(fare.minimum_fare).to be_a_kind_of(Fixnum)
  end

  it "has a fine value" do
    expect(fare.fine).to be_a_kind_of(Fixnum)
  end

  it "new_jorney_at_touch_in?" do
    expect(fare.new_jorney_at_touch_in?).to eq(true) | eq(false)
  end

end
