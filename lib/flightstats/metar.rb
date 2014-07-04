module FlightStats
  class Metar < Resource
    attr_accessor :report,
    			  :report_time,
    			  :report_modifier,
    			  :weather_station_icao,
    			  :conditions,
    			  :tags,
    			  :temperature_celsius,
    			  :dew_point_celsius,
    			  :runway_visual_ranges,
    			  :obscurations,
    			  :no_significant_change
  end
end