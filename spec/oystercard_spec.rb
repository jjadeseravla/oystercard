require 'oystercard'

describe Oystercard do

  it 'should be able to test that a freshly initialized card has a balance of 0 by default' do
    expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
  end

  it "should enable an oystercard's balance to be topped up" do
    top_up_amount = 10
    subject.top_up(top_up_amount)
    expect(subject.balance).to eq top_up_amount
  end

  describe '#top_up' do
    it "should raise an error when top_up_amount would cause card's balance to exceed maximum balance" do
      expect { subject.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error(BalanceError)
    end
  end

  describe '#deduct' do
    it 'should be able to deduct an amount from card balance' do
      top_up_amount = 10
      debit_amount = 5
      card = Oystercard.new(top_up_amount)
      card.deduct(debit_amount)
      expect(card.balance).to eq (top_up_amount - debit_amount)
    end
  end

  describe '#touch_in' do
    it "should be able to touch in at barrier" do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe '#touch_out' do
    it "should be able to touch out at barrier" do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

end
