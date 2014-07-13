require 'spec_helper'
require 'time'

describe FlightStats::ScheduledFlight do

  describe '#by_carrier_and_flight_number_departing_on' do
    it 'must return a CDG departure schedule' do
      in_three_days = Time.now + (60 * 60 * 24 * 3)
      scheduled_flights = FlightStats::ScheduledFlight.by_carrier_and_flight_number_departing_on 'AF', '111', in_three_days.year, in_three_days.month, in_three_days.day
      scheduled_flights.first.carrier_fs_code.should == 'AF'
    end
  end

  describe '#by_carrier_and_flight_number_arriving_on' do
    it 'must return a CDG departure schedule' do
      in_three_days = Time.now + (60 * 60 * 24 * 3)
      scheduled_flights = FlightStats::ScheduledFlight.by_carrier_and_flight_number_departing_on 'AF', '111', in_three_days.year, in_three_days.month, in_three_days.day
      scheduled_flights.first.carrier_fs_code.should == 'AF'
    end
  end

  describe '#by_route_departing_on' do
    it 'must return a CDG departure schedule' do
      in_three_days = Time.now + (60 * 60 * 24 * 3)
      scheduled_flights = FlightStats::ScheduledFlight.by_route_departing_on 'CDG', 'GVA', in_three_days.year, in_three_days.month, in_three_days.day
      scheduled_flights.first.departure_airport_fs_code.should == 'CDG'
    end
  end

  describe '#by_route_arriving_on' do
    it 'must return a CDG departure schedule' do
      in_three_days = Time.now + (60 * 60 * 24 * 3)
      scheduled_flights = FlightStats::ScheduledFlight.by_route_arriving_on 'CDG', 'GVA', in_three_days.year, in_three_days.month, in_three_days.day
      scheduled_flights.first.departure_airport_fs_code.should == 'CDG'
    end
  end

  describe '#departing_from_airport_at_date_and_hour' do
    it 'must return a SFO departure schedule' do
      in_three_days = Time.now + (60 * 60 * 24 * 3)
      scheduled_flights = FlightStats::ScheduledFlight.departing_from_airport_at_date_and_hour 'SFO', in_three_days.year, in_three_days.month, in_three_days.day, in_three_days.hour
      scheduled_flights.first.departure_airport_fs_code.should == 'SFO'
    end
  end

  describe '#arriving_at_airport_at_date_and_hour' do
    it 'must return a SFO departure schedule' do
      in_three_days = Time.now + (60 * 60 * 24 * 3)
      scheduled_flights = FlightStats::ScheduledFlight.arriving_at_airport_at_date_and_hour 'SFO',  in_three_days.year, in_three_days.month, in_three_days.day, in_three_days.hour
      scheduled_flights.first.arrival_airport_fs_code.should == 'SFO'
    end
  end
end
