module FlightStats
  class Equipment < Resource
    attr_accessor :iata,
                  :name,
                  :turbo_prop,
                  :jet,
                  :widebody,
                  :regional
  end
end