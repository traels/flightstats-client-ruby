module FlightStats
  class Schedule < Resource
    attr_accessor :flight_type,
                  :service_classes,
                  :restrictions,
                  :downlines,
                  :uplines
  end
end