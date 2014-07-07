require 'spec_helper'

describe FlightStats::Rating do

  describe '#flight' do
    it 'should have a rating' do
      rating = FlightStats::Rating.flight 'UA', '901'
      rating.first.airline_fs_code.should == 'UA'
    end
  end

  describe '#route' do
    it 'should have a rating' do
      rating = FlightStats::Rating.route 'PDX', 'HNL'
      rating.first.departure_airport_fs_code.should == 'PDX'
    end
  end
end
