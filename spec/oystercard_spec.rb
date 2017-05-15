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

end
