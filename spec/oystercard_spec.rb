require 'oystercard'

describe OysterCard do

  subject(:card) {described_class.new}
  let (:station) {double :station}

  before do
    @top_up_value = 10
    @max_top_up = 90
    @deduct_value = 1
    allow(station).to receive(:in_journey).and_return(false)
    allow(station).to receive(:in_journey).and_return(true)
    allow(station).to receive(:name).and_return('wembley')
    allow(station).to receive(:zone).and_return(4)
  end

  it 'touch_in raises an error if minimum fare not met' do
    expect{card.touch_in(station)}.to raise_error "insufficient funds to complete journey"
  end

  context 'card is topped up' do
    before do
      card.top_up(@top_up_value)
    end

    it 'adds top-up to balance' do
      expect(card.balance).to eq @top_up_value
    end

    it 'raises an error if balance is more than 90' do
      expect {card.top_up(@max_top_up)}.to raise_error "balance cannot exceed #{OysterCard::MAX_LIMIT} pounds"
    end
  end

end
