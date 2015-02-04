require 'json'
module FlightStats
  class Alert < OpenStruct #Resource
    # include Virtus.model
    # attribute :data, Hash

    @@base_path = "/flex/alerts/rest/v1/json/create"

    class << self
      def by_arrival(carrier, flight_number, arrival_airport, year, month, day, options = {})
        from_response API.get("#{base_path}/#{carrier}/#{flight_number}/to/#{arrival_airport}/arriving/#{year}/#{month}/#{day}", {}, options), 'alert'
      end

      def base_path
        @@base_path
      end

      def from_response(response, fdf)
        parsed = JSON.parse(response.body, symbolize_names: true)
        with_data = parsed.merge(data: parsed)
        new(with_data)
      end
    end
  end
end
