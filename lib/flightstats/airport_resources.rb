module FlightStats
  class AirportResources < Resource
    attr_accessor :departure_gate,
                  :departure_terminal,
                  :arrival_terminal,
                  :arrival_gate
  end
end