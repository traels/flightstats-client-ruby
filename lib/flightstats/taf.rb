module FlightStats
  class Taf < Resource
    attr_accessor :report,
    			  :report_time,
    			  :observation_time,
                  :report_type,
                  :weather_station_icao,
                  :forecasts
  end
end