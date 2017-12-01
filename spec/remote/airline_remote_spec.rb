require 'spec_helper'
require 'time'

describe FlightStats::Airline do
  it "must find AAL" do
    airports = FlightStats::Airline.by_iata_code 'AA'
    airports.first.active.should be true
    airports.first.name.should == 'American Airlines'
    airports.first.icao.should == 'AAL'
  end
end