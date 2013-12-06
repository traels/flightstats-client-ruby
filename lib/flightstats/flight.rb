module FlightStats
  class Flight < Resource
    attr_accessor :departure_airport_fs_code,
                  :arrival_airport_fs_code,
                  :departure_date_from,
                  :departure_date_to,
                  :departure_days_of_week,
                  :arrival_date_adjustment,
                  :departure_time,
                  :arrival_time,
                  :distance_miles,
                  :flight_duration_minutes,
                  :layover_duration_minutes,
                  :flight_type,
                  :service_type,
                  :online,
                  :flight_legs

    class << self
      def direct_arriving_at(arrival_code, year, month, day, params = {}, options = {})
        from_response API.get("/flex/connections/rest/v1/json/direct/to/#{arrival_code}/arriving/#{year}/#{month}/#{day}", params, options), 'flights'
      end

      def direct_departing_from(departure_code, year, month, day, params = {}, options = {})
        from_response API.get("/flex/connections/rest/v1/json/direct/from/#{departure_code}/departing/#{year}/#{month}/#{day}", params, options), 'flights'
      end

      def direct_arriving_by_flight_number(carrier, flight_number, year, month, day, params = {}, options = {})
        from_response API.get("/flex/connections/rest/v1/json/direct/flight/#{carrier}/#{flight_number}/arriving/#{year}/#{month}/#{day}", params, options), 'flights'
      end

      def direct_arriving_by_flight_number_and_location(carrier, flight_number, arrival_code, year, month, day, params = {}, options = {})
        from_response API.get("/flex/connections/rest/v1/json/direct/flight/#{carrier}/#{flight_number}/to/#{arrival_code}/arriving/#{year}/#{month}/#{day}", params, options), 'flights'
      end

      def direct_departing_by_flight_number(carrier, flight_number, year, month, day, params = {}, options = {})
        from_response API.get("/flex/connections/rest/v1/json/direct/flight/#{carrier}/#{flight_number}/departing/#{year}/#{month}/#{day}", params, options), 'flights'
      end

      def direct_departing_by_flight_number_and_location(carrier, flight_number, arrival_code, year, month, day, params = {}, options = {})
        from_response API.get("/flex/connections/rest/v1/json/direct/flight/#{carrier}/#{flight_number}/from/#{arrival_code}/departing/#{year}/#{month}/#{day}", params, options), 'flights'
      end

      def direct_and_connecting_arriving(departure_code, arrival_code, year, month, day, params = {}, options = {})
        from_response API.get("/flex/connections/rest/v1/json/connecting/from/#{departure_code}/to/#{arrival_code}/arriving/#{year}/#{month}/#{day}", params, options), 'flights'
      end

      def direct_and_connecting_departing(departure_code, arrival_code, year, month, day, params = {}, options = {})
        from_response API.get("/flex/connections/rest/v1/json/connecting/from/#{departure_code}/to/#{arrival_code}/departing/#{year}/#{month}/#{day}", params, options), 'flights'
      end
    end

    def to_s
      str = "#{departure_airport_fs_code} - #{arrival_airport_fs_code} (#{distance_miles} miles): from #{departure_date_from} to #{departure_date_to}"
      flight_legs.each do |leg|
        str << "\n  #{leg.to_s}"
      end
      str
    end
  end
end
