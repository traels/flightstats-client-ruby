module FlightStats
  class Forecast < Resource
    attr_accessor :type,
                  :start,
                  :end,
                  :probability,
                  :conditions
  end
end