require 'spec_helper'
require 'spec_mock_helper'

describe FlightStats::Rating do
  before(:each) do
    WebMock.reset!
  end

  describe "flight" do
    it "should have a rating" do
      stub_api_request :get, FlightStats::Rating.base_path, 'rating'
      rating = FlightStats::Rating.flight 'UA', '901'
      rating.first.should be_an_instance_of FlightStats::Rating
      rating.first.airline_fs_code.should == 'UA'
      rating.first.flight_number.should == '901'
    end
  end

  describe "route" do
    it "should have a rating" do
      stub_api_request :get, FlightStats::Rating.base_path, 'ratings'
      rating = FlightStats::Rating.route 'PDX', 'HNL'
      rating.first.should be_an_instance_of FlightStats::Rating
      rating.first.airline_fs_code.should == 'HA'
      rating.first.flight_number.should == '25'
    end
  end
end