module FlightStats
  class DayForecast < Resource
    attr_accessor :day,
    			  :forecast,
    			  :start,
    			  :end,
    			  :tags
  end
end