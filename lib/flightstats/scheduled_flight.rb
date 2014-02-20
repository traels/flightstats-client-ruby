module FlightStats
  class ScheduledFlight < Resource
    attr_accessor :carrier_fs_code,
                  :flight_number,
                  :departure_airport_fs_code,
                  :arrival_airport_fs_code,
                  :stops,
                  :departure_terminal,
                  :arrival_terminal,
                  :departure_time,
                  :arrival_time,
                  :flight_equipment_iata_code,
                  :is_codeshare,
                  :is_wetlease,
                  :codeshares,
                  :service_type,
                  :service_classes,
                  :traffic_restrictions,
                  :reference_code

    @@base_path = "/flex/schedules/rest/v1/json"

    class << self
      def by_route_departing_on(departure_code, arrival_code, year, month, day, params = {}, options = {})
        from_response API.get("#{base_path}/from/#{departure_code}/to/#{arrival_code}/departing/#{year}/#{month}/#{day}", params, options), 'scheduledFlights'
      end

      def base_path
        @@base_path
      end
    end
  end
end
