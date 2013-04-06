require 'spec_helper'
require 'time'

describe FlightStats::Airport do
  # Really slow
  # it "must find all airports" do
  #   airports = FlightStats::Airport.actives
  #   airports.size.should >= 200
  # end

  it "must find PDX" do
    airport = FlightStats::Airport.current 'PDX'
    airport.active.should be true
    airport.city.should == 'Portland'
    airport.iata.should == 'PDX'
  end

  it "must find PDX on date" do
    now = Time.now
    airport = FlightStats::Airport.on_date 'PDX', now.year, now.month, now.day
    airport.active.should be true
    airport.city.should == 'Portland'
    airport.iata.should == 'PDX'
  end

  it "must find PDX by city code" do
    airports = FlightStats::Airport.by_city_code 'PDX'
    airports.size.should == 1
    airport = airports.first

    airport.active.should be true
    airport.city.should == 'Portland'
    airport.iata.should == 'PDX'
  end

  it "must find all airports by country code" do
    airports = FlightStats::Airport.by_country_code 'GB'
    airports.size.should >= 200
  end

  it "must find PDX by fs code" do
    airport = FlightStats::Airport.by_flight_stats_code 'PDX'
    airport.active.should be true
    airport.city.should == 'Portland'
    airport.iata.should == 'PDX'
  end

  it "must find PDX by iata code" do
    airports = FlightStats::Airport.by_iata_code 'PDX'
    airports.size.should == 1
    airport = airports.first

    airport.active.should be true
    airport.city.should == 'Portland'
    airport.iata.should == 'PDX'
  end

  it "must find PDX by icao code" do
    airports = FlightStats::Airport.by_icao_code 'KPDX'
    airports.size.should == 1
    airport = airports.first

    airport.active.should be true
    airport.city.should == 'Portland'
    airport.iata.should == 'PDX'
  end

  it "must find airports by location" do
    airports = FlightStats::Airport.within_radius 17, 39, 150
    airports.size.should == 9
  end
end