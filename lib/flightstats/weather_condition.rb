module FlightStats
  class WeatherCondition < Resource
    attr_accessor :phenomenon,
                  :descriptor,
                  :intensity
  end
end