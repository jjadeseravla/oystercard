require 'oystercard'

describe Oystercard do

  it 'should be able to test that a freshly initialized card has a balance of 0 by default' do
    expect(subject.balance).to eq 0
  end

  it "should enable an oystercard's balance to be topped up" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end  

end
