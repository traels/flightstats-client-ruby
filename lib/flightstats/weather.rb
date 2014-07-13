module FlightStats
  class Weather < Resource
    attr_accessor :metar,
                  :taf,
                  :zone_forecast

    @@base_path = "/flex/weather/rest/v1/json"

    class << self
      def all(airport, options = {})
        from_response API.get("#{base_path}/all/#{airport}", {}, options), 'weather'
      end

      def metar(airport, options = {})
        from_response API.get("#{base_path}/metar/#{airport}", {}, options), 'metar'
      end

      def taf(airport, options = {})
        from_response API.get("#{base_path}/taf/#{airport}", {}, options), 'taf'
      end

      def zone_forecast(airport, options = {})
        from_response API.get("#{base_path}/zf/#{airport}", {}, options), 'zoneForecast'
      end

      def base_path
        @@base_path
      end
    end
  end
end
