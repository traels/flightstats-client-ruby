require 'spec_helper'
require 'spec_mock_helper'

describe FlightStats::Alert do
  before(:each) do
    WebMock.reset!
  end

  let(:carrier)           { "AA"    }
  let(:flight_number)     { "100"   }
  let(:departure_airport) { "JFK"   }
  let(:arrival_airport)   { "TXL"   }
  let(:year)              { "2015"  }
  let(:month)             { "04"    }
  let(:day)               { "10"    }
  let(:rule_id)           { "34123" }
  let(:deliver_to)        { "http://mydomain.com/flight_alert" }

  shared_examples_for "alert details are returned" do
    let(:rule)         { alert.rule }

    it "rule" do
      rule.id.should == "125524637"
      rule.name.should == "Example alert name"
      rule.description.should == "Example alert description"
      rule.carrier_fs_code.should == "AA"
      rule.flight_number.should == "100"
      rule.departure_airport_fs_code.should == "JFK"
      rule.arrival_airport_fs_code.should == "LHR"
      rule.departure.should == "2013-02-26T18:15:00.000"
      rule.arrival.should == "2013-02-27T06:20:00.000"
      rule.rule_events.should == [{ "type" => "ALL_CHANGES" }]
      rule.delivery.should == { "format" => "json", "destination" => "https://example.com/your_post_url" }
    end
  end

  shared_examples_for "alert capabilities are returned" do
    let(:capabilities) { alert.alert_capabilities }

    it "capabilities" do
      capabilities.should == {
        "baggage" => true,
        "departureGateChange" => true,
        "arrivalGateChange" => true,
        "gateDeparture" => true,
        "gateArrival" => true,
        "runwayDeparture" => true,
        "runwayArrival" => true
      }
    end
  end

  describe "creating alerts" do
    before do
      stub_api_request(:get, described_class.base_path, 'create_alert')
    end

    describe "flight_rule_by_arrival" do
      let(:alert) do
        described_class.flight_rule_by_arrival(carrier, flight_number, arrival_airport, year, month, day, deliver_to)
      end

      it_behaves_like "alert details are returned"
      it_behaves_like "alert capabilities are returned"
    end

    describe "flight_rule_by_departure" do
      let(:alert) do
        described_class.flight_rule_by_departure(carrier, flight_number, departure_airport, year, month, day, deliver_to)
      end

      it_behaves_like "alert details are returned"
      it_behaves_like "alert capabilities are returned"
    end

    describe "flight_rule_for_route_with_arrival_date" do
      let(:alert) do
        described_class.flight_rule_for_route_with_arrival_date(carrier, flight_number, departure_airport, arrival_airport, year, month, day, deliver_to)
      end

      it_behaves_like "alert details are returned"
      it_behaves_like "alert capabilities are returned"
    end

    describe "flight_rule_for_route_with_departure_date" do
      let(:alert) do
        described_class.flight_rule_for_route_with_departure_date(carrier, flight_number, departure_airport, arrival_airport, year, month, day, deliver_to)
      end

      it_behaves_like "alert details are returned"
      it_behaves_like "alert capabilities are returned"
    end
  end

  describe "delete_rule_by_id" do
    before do
      stub_api_request(:get, described_class.base_path, 'delete_alert')
    end

    let(:alert) do
      described_class.delete_rule_by_id(rule_id)
    end

    it_behaves_like "alert details are returned"
  end

  describe "retrieve_registered_rule_by_id" do
    before do
      stub_api_request(:get, described_class.base_path, 'retrieve_alert')
    end

    let(:alert) do
      described_class.retrieve_registered_rule_by_id(rule_id)
    end

    it_behaves_like "alert details are returned"
  end

  describe "list_alert_rule_ids" do
    before do
      stub_api_request(:get, described_class.base_path, 'list_alerts')
    end

    let(:list) do
      described_class.list_alert_rule_ids
    end

    it "returns the ids" do
      list["ruleIds"].should == [256327870]
    end
  end
end
