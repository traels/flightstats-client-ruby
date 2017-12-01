module FlightStats
  class Rule < Resource
    attr_accessor :id,
                  :name,
                  :description,
                  :carrier_fs_code,
                  :flight_number,
                  :departure_airport_fs_code,
                  :arrival_airport_fs_code,
                  :departure,
                  :arrival,
                  :rule_events,
                  :name_values,
                  :delivery
  end
end
