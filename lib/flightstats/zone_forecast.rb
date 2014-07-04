module FlightStats
  class ZoneForecast < Resource
    attr_accessor :header,
    			  :general,
    			  :zones,
    			  :report_time,
    			  :cities,
    			  :zone_names,
    			  :day_forecasts
  end
end