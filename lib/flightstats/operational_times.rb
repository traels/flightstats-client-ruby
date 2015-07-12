module FlightStats
  class OperationalTimes < Resource
    attr_accessor :published_departure,
                  :published_arrival,
                  :scheduled_gate_departure,
                  :estimated_gate_departure,
                  :actual_gate_departure,
                  :flight_plan_planned_departure,
                  :estimated_runway_departure,
                  :actual_runway_departure,
                  :scheduled_gate_arrival,
                  :estimated_gate_arrival,
                  :flight_plan_planned_arrival,
                  :estimated_runway_arrival,
                  :actual_gate_arrival,
                  :actual_runway_arrival
  end
end