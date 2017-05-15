require_relative '../lib/station'

describe Station do

  it 'should have a name, defined when instantiated' do
    station = Station.new(:waterloo, 1)
    expect(station.name).to eq :waterloo
  end

  it 'should have a zone, defined when instantiated' do
    station = Station.new(:waterloo, 1)
    expect(station.zone).to eq 1
  end

end