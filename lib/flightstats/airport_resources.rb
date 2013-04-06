module FlightStats
  class AirportResources < Resource
    attr_accessor :departure_gate,
                  :arrival_terminal,
                  :arrival_gate
  end
end