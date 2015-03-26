module FlightStats
  class Alert < Resource
    attr_accessor :rule,
                  :alert_capabilities

    @@base_path = "/flex/alerts/rest/v1/json"

    class << self

      def flight_rule_by_arrival(carrier, flight_number, arrival_airport, year, month, day, deliver_to, type = "JSON", params = {}, options = {})
        from_response API.get("#{base_path}/create/#{carrier}/#{flight_number}/to/#{arrival_airport}/arriving/#{year}/#{month}/#{day}", params, options), "alerts"
      end

      def flight_rule_by_departure(carrier, flight_number, departure_airport, year, month, day, deliver_to, type = "JSON", params = {}, options = {})
        from_response API.get("#{base_path}/create/#{carrier}/#{flight_number}/from/#{departure_airport}/departing/#{year}/#{month}/#{day}", params, options), "alerts"
      end

      def flight_rule_for_route_with_arrival_date(carrier, flight_number, departure_airport, arrival_airport, year, month, day, deliver_to, type = "JSON", params = {}, options = {})
        from_response API.get("#{base_path}/create/#{carrier}/#{flight_number}/from/#{departure_airport}/to/#{arrival_airport}/arriving/#{year}/#{month}/#{day}", params, options), "alerts"
      end

      def flight_rule_for_route_with_departure_date(carrier, flight_number, departure_airport, arrival_airport, year, month, day, deliver_to, type = "JSON", params = {}, options = {})
        from_response API.get("#{base_path}/create/#{carrier}/#{flight_number}/from/#{departure_airport}/to/#{arrival_airport}/departing/#{year}/#{month}/#{day}", params, options), "alerts"
      end

      def delete_rule_by_id(rule_id, params = {}, options = {})
        from_response API.get("#{base_path}/delete/#{rule_id}", params, options), "alerts"
      end

      def retrieve_registered_rule_by_id(rule_id, params = {}, options = {})
        from_response API.get("#{base_path}/get/#{rule_id}", params, options), "alerts"
      end

      def list_alert_rule_ids(params = {}, options = {})
        from_response API.get("#{base_path}/list", params, options)
      end

      def test_alert_services(carrier, flight_number, departure_airport, arrival_airport, deliver_to, params = {}, options = {})
        from_response API.get("#{base_path}/testdelivery/#{carrier}/#{flight_number}/from/#{departure_airport}/to/#{arrival_airport}", params, options)
      end

      def base_path
        @@base_path
      end
    end
  end
end
