require 'spec_helper'

describe FlightStats::Weather do

  describe "all" do
    it "must display all available weather for airport" do
      stub_api_request :get, FlightStats::Weather.base_path, 'weather'
      weather = FlightStats::Weather.all 'SFO'
      weather.should be_an_instance_of FlightStats::Weather
      weather.metar.should be_an_instance_of FlightStats::Metar
    end
  end

  describe "metar" do
    it "must display metar for airport" do
      stub_api_request :get, FlightStats::Weather.base_path, 'metar'
      weather = FlightStats::Weather.metar 'SFO'
      weather.should be_an_instance_of FlightStats::Metar
      weather.weather_station_icao.should == 'KSFO'
    end
  end

  describe "taf" do
    it "must display taf for airport" do
      stub_api_request :get, FlightStats::Weather.base_path, 'taf'
      weather = FlightStats::Weather.taf 'SFO'
      weather.should be_an_instance_of FlightStats::Taf
      weather.weather_station_icao.should == 'KSFO'
    end
  end

  describe "zone forecast" do
    it "must display zone forecast for airport" do
      stub_api_request :get, FlightStats::Weather.base_path, 'zf'
      weather = FlightStats::Weather.zone_forecast 'SFO'
      weather.should be_an_instance_of FlightStats::ZoneForecast
    end
  end
end