require 'spec_helper'
require 'spec_mock_helper'

describe FlightStats::Airline do
  before(:each) do
    WebMock.reset!
  end

  describe "by_iata_code" do
    it "must find airline" do
      stub_api_request :get, FlightStats::Airline.base_path, 'airline'
      airline = FlightStats::Airline.by_iata_code 'AA'
      airline.should be_an_instance_of FlightStats::Airline
      # airline.icao.should == 'AAL'
    end
  end
end