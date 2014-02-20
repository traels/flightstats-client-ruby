module FlightStats
  class ScheduledFlight < Resource

    @@base_path = "/flex/schedules/rest/v1/json"

    class << self
      def by_flight_id(departure_code, arrival_code, year, month, day, params = {}, options = {})
        from_response API.get("#{base_path}/from/#{departure_code}/to/#{arrival_code}/departing/#{year}/#{month}/#{day}", params, options)
      end
    end
  end
end
