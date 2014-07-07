require 'spec_helper'
require 'spec_mock_helper'

describe FlightStats::FidsData do
  before(:each) do
    WebMock.reset!
  end

  describe "departing_from" do
    it "must have fids data" do
      stub_api_request :get, FlightStats::FidsData.base_path, 'fids'
      fids = FlightStats::FidsData.departing_from 'ABQ', 'airlineCode,flightNumber,city,currentTime,gate,remarks'
      fids.first.should be_an_instance_of FlightStats::FidsData
      fids.first.airline_code.should == 'DL'
    end
  end

  describe "arriving_at" do
    it "must have fids data" do
      stub_api_request :get, FlightStats::FidsData.base_path, 'fids'
      fids = FlightStats::FidsData.arriving_at 'ABQ', 'airlineCode,flightNumber,city,currentTime,gate,remarks'
      fids.first.should be_an_instance_of FlightStats::FidsData
      fids.first.airline_code.should == 'DL'
    end
  end
end