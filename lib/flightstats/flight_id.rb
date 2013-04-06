module FlightStats
  class FlightId < Resource
    attr_accessor :requested,
                  :interpreted
  end
end