require 'spec_helper'

describe FlightStats::Resource do
  it "must find the right model" do
    FlightStats::Resource.string_to_model(nil).should be_nil
    FlightStats::Resource.string_to_model("restrictions").should be_nil
    FlightStats::Resource.string_to_model("serviceClasses").should be_nil
    FlightStats::Resource.string_to_model("flightType").should be_nil
    FlightStats::Resource.string_to_model("schedule").should == FlightStats::Schedule
    FlightStats::Resource.string_to_model("airline").should == FlightStats::Airline
    FlightStats::Resource.string_to_model("airport").should == FlightStats::Airport
    FlightStats::Resource.string_to_model("equipment").should == FlightStats::Equipment
    FlightStats::Resource.string_to_model("flightStatus").should == FlightStats::FlightStatus
    FlightStats::Resource.string_to_model("arrivalDate").should == FlightStats::ArrivalDate
    FlightStats::Resource.string_to_model("metar").should == FlightStats::Metar
  end

  it "must deserialize a simple hash correctly" do
    json_string =<<eos
{
  "schedule": {
      "flightType": "J",
      "restrictions": "",
      "serviceClasses": "FJY"
  }
}
eos
    schedule = FlightStats::Resource.from_json(json_string, 'schedule')
    check_schedule schedule, "J", "", "FJY"
  end

  it "must deserialize a simple hash with nested object correctly" do
    json_string =<<eos
{
  "flightStatus": {
                    "arrivalDate": {
                        "dateLocal": "2013-04-06T16:25:00.000",
                        "dateUtc": "2013-04-06T23:25:00.000Z"
                    },
                    "schedule": {
                        "flightType": "J",
                        "restrictions": "",
                        "serviceClasses": "FJY"
                    },
                    "status": "A"
                  }
}
eos

    flight_status = FlightStats::Resource.from_json(json_string, 'flightStatus')
    flight_status.should be_an_instance_of FlightStats::FlightStatus

    check_arrival_date flight_status.arrival_date, "2013-04-06T16:25:00.000", "2013-04-06T23:25:00.000Z"

    check_schedule flight_status.schedule, "J", "", "FJY"

    flight_status.status.should be_an_instance_of String
    flight_status.status.should == "A"
  end

  it "must deserialize a simple array correctly" do
    json_string =<<eos
{
  "schedules": [{
                  "flightType": "A",
                  "restrictions": "B",
                  "serviceClasses": "C"
                },
                {
                  "flightType": "D",
                  "restrictions": "E",
                  "serviceClasses": "F"
                }]
}
eos
    schedules = FlightStats::Resource.from_json(json_string, 'schedules')
    schedules.should be_an_instance_of Array
    schedules.size.should == 2
    check_schedule schedules[0], "A", "B", "C"
    check_schedule schedules[1], "D", "E", "F"
  end

  it "must deserialize a complex object correctly" do
    json_object =<<eos
{
  "appendix": {
                "airlines": [{
                                "active": true,
                                "fs": "UA"
                            }],
                "airports": [{
                                "active": true,
                                "city": "San Francisco",
                                "cityCode": "SFO",
                                "utcOffsetHours": -7.0
                            }],
                "equipments": [{
                                  "iata": "B744",
                                  "jet": false
                              }]
              },
  "flightStatuses": [
                      {
                        "arrivalDate": {
                            "dateLocal": "2013-04-06T16:25:00.000",
                            "dateUtc": "2013-04-06T23:25:00.000Z"
                        },
                        "schedule": {
                            "flightType": "J",
                            "restrictions": "",
                            "serviceClasses": "FJY"
                        },
                        "status": "A"
                      }
                    ]
}
eos
    flight_statuses = FlightStats::Resource.from_json(json_object, 'flightStatuses')
    flight_statuses.size.should == 1
    flight_status = flight_statuses.first

    flight_status.should be_an_instance_of FlightStats::FlightStatus

    check_arrival_date flight_status.arrival_date, "2013-04-06T16:25:00.000", "2013-04-06T23:25:00.000Z"

    check_schedule flight_status.schedule, "J", "", "FJY"

    flight_status.status.should be_an_instance_of String
    flight_status.status.should == "A"
  end

  private

  def check_arrival_date(arrival_date, date_local, date_utc)
    arrival_date.should be_an_instance_of FlightStats::ArrivalDate
    arrival_date.date_local.should == date_local
    arrival_date.date_utc.should == date_utc
  end

  def check_schedule(schedule, flight_type, restrictions, service_classes)
    schedule.should be_an_instance_of FlightStats::Schedule
    schedule.flight_type.should be_an_instance_of String
    schedule.flight_type.should == flight_type
    schedule.restrictions.should be_an_instance_of String
    schedule.restrictions.should == restrictions
    schedule.service_classes.should be_an_instance_of String
    schedule.service_classes.should == service_classes
  end
end