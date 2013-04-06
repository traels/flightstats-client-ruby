require 'spec_helper'
require 'spec_mock_helper'

describe FlightStats::FlightStatus do
  before(:each) do
    WebMock.reset!
  end

  describe "by_flight_id" do
    it "must find flight status" do
      stub_api_request :get, FlightStats::FlightStatus.base_path, 'flight_status'
      airport = FlightStats::FlightStatus.by_flight_id 289606238
      airport.should be_an_instance_of FlightStats::FlightStatus
      airport.departure_airport_fs_code.should == 'PDX'
      airport.flight_id.should == 289606238
    end
  end
end