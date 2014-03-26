require 'spec_helper'
require 'time'

describe FlightStats::ScheduledFlight do

  describe '#by_route_departing_on' do
    it 'must return a CDG departure schedule' do
      in_three_days = Time.now + (60 * 60 * 24 * 3)
      scheduled_flights = FlightStats::ScheduledFlight.by_route_departing_on 'CDG', 'GVA', in_three_days.year, in_three_days.month, in_three_days.day
      scheduled_flights.first.departure_airport_fs_code.should == 'CDG'
    end
  end

  describe '#by_carrier_and_flight_number_departing_on' do
    it 'must return a CDG departure schedule' do
      in_three_days = Time.now + (60 * 60 * 24 * 3)
      scheduled_flights = FlightStats::ScheduledFlight.by_carrier_and_flight_number_departing_on 'AF', '111', in_three_days.year, in_three_days.month, in_three_days.day
      scheduled_flights.first.carrier_fs_code.should == 'AF'
    end
  end
end
