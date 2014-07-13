module FlightStats
  class Rating < Resource
    attr_accessor :departure_airport,
                  :departure_airport_fs_code,
                  :arrival_airport,
                  :arrival_airport_fs_code,
                  :airline,
                  :airline_fs_code,
                  :flight_number,
                  :codeshares,
                  :directs,
                  :observations,
                  :ontime,
                  :late15,
                  :late30,
                  :late45,
                  :cancelled,
                  :diverted,
                  :ontime_percent,
                  :delay_observations,
                  :delay_mean,
                  :delay_standard_deviation,
                  :delay_min,
                  :delay_max,
                  :all_ontime_cumulative,
                  :all_ontime_stars,
                  :all_delay_cumulative,
                  :all_delay_stars,
                  :all_stars

    @@base_path = "/flex/ratings/rest/v1/json"

    class << self
      def flight(carrier, flight_number, options = {})
        from_response API.get("#{base_path}/flight/#{carrier}/#{flight_number}", {}, options), 'ratings'
      end

      def route(departure_code, arrival_code, options = {})
        from_response API.get("#{base_path}/route/#{departure_code}/#{arrival_code}", {}, options), 'ratings'
      end

      def base_path
        @@base_path
      end
    end
  end
end