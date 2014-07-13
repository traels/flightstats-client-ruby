module FlightStats
  class Condition < Resource
    attr_accessor :wind,
                  :visibility,
                  :weather_conditions,
                  :sky_conditions,
                  :pressure_inches_hg
  end
end