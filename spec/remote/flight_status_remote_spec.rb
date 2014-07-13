require 'spec_helper'
require 'time'

describe FlightStats::FlightStatus do
  it "must find UA 901" do
    now = Time.now
    flight_statuses = FlightStats::FlightStatus.departing_on 'UA', 901, now.year, now.month, now.day
    flight_status = flight_statuses.first
    flight_status.flight_number.should == '901'
    flight_status.carrier_fs_code.should == 'UA'
    flight_status.departure_airport_fs_code.should == 'FRA'
    flight_status.arrival_airport_fs_code.should == 'SFO'
  end
end