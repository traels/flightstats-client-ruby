require 'spec_helper'

describe FlightStats::FidsData do

  describe "departing_from" do
    it "must have fids data" do
      fids = FlightStats::FidsData.departing_from 'ABQ', 'airlineCode,flightNumber,city,currentTime,gate,remarks'
      fids.first.should be_an_instance_of FlightStats::FidsData
    end
  end

  describe "arriving_at" do
    it "must have fids data" do
      fids = FlightStats::FidsData.arriving_at 'ABQ', 'airlineCode,flightNumber,city,currentTime,gate,remarks'
      fids.first.should be_an_instance_of FlightStats::FidsData
    end
  end
end