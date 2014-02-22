require 'spec_helper'
require 'time'

describe FlightStats::ScheduledFlight do

  it 'must return a CDG departure schedule' do
    # now + three days in seconds
    in_three_days = Time.now + (60 * 60 * 24 * 3)
    scheduled_flights = FlightStats::ScheduledFlight.by_route_departing_on 'CDG', 'GVA', in_three_days.year, in_three_days.month, in_three_days.day
    scheduled_flights.first.departure_airport_fs_code.should == 'CDG'
  end
end
