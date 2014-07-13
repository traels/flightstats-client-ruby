module FlightStats
  class SkyCondition < Resource
    attr_accessor :coverage,
                  :base,
                  :modifier
  end
end