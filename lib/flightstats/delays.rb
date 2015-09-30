module FlightStats
  class Delays < Resource
    attr_accessor :departure_gate_delay_minutes,
                  :arrival_gate_delay_minutes
  end
end
