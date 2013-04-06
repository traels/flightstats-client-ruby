require 'spec_helper'

describe FlightStats::Helper do
  it "must singularize correctly" do
    FlightStats::Helper.singularize("schedule").should == "schedule"
    FlightStats::Helper.singularize("schedules").should == "schedule"
    FlightStats::Helper.singularize("flightStatuses").should == "flightStatus"
  end
end