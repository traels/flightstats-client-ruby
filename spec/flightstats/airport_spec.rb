require 'spec_helper'
require 'spec_mock_helper'

describe FlightStats::Airport do
  before(:each) do
    WebMock.reset!
  end

  describe "by_flight_stats_code" do
    it "must find airport" do
      stub_api_request :get, FlightStats::Airport.base_path, 'airport'
      airport = FlightStats::Airport.by_flight_stats_code 'PDX'
      airport.should be_an_instance_of FlightStats::Airport
      airport.fs.should == 'PDX'
    end
  end
end