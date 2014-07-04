module FlightStats
  class Airport < Resource
    attr_accessor :fs,
                  :iata,
                  :icao,
                  :faa,
                  :name,
                  :street1,
                  :city,
                  :city_code,
                  :district,
                  :state_code,
                  :postal_code,
                  :country_code,
                  :country_name,
                  :region_name,
                  :time_zone_region_name,
                  :weather_zone,
                  :local_time,
                  :utc_offset_hours,
                  :latitude,
                  :longitude,
                  :elevation_feet,
                  :classification,
                  :active,
                  :delay_index_url,
                  :weather_url

    @@base_path = "/flex/airports/rest/v1/json"

    class << self
      def actives(options = {})
        from_response API.get("#{base_path}/active", {}, options), 'airports'
      end

      def actives_for_date(year, month, day, options = {})
        from_response API.get("#{base_path}/active/#{year}/#{month}/#{day}", {}, options), 'airports'
      end

      def all(options = {})
        from_response API.get("#{base_path}/all", {}, options), 'airports'
      end

      def current(code, options = {})
        from_response API.get("#{base_path}/#{code}/today", {}, options), 'airport'
      end

      def on_date(code, year, month, day, options = {})
        from_response API.get("#{base_path}/#{code}/#{year}/#{month}/#{day}", {}, options), 'airport'
      end

      def by_city_code(city_code, options = {})
        from_response API.get("#{base_path}/cityCode/#{city_code}", {}, options), 'airports'
      end

      def by_country_code(country_code, options = {})
        from_response API.get("#{base_path}/countryCode/#{country_code}", {}, options), 'airports'
      end

      def by_flight_stats_code(flight_stats_code, options = {})
        from_response API.get("#{base_path}/fs/#{flight_stats_code}", {}, options), 'airport'
      end

      def by_iata_code(iata_code, options = {})
        from_response API.get("#{base_path}/iata/#{iata_code}", {}, options), 'airports'
      end

      def by_iata_code_on_date(iata_code, year, month, day, options = {})
        from_response API.get("#{base_path}/iata/#{iata_code}/#{year}/#{month}/#{day}", {}, options), 'airport'
      end

      def by_icao_code(icao_code, options = {})
        from_response API.get("#{base_path}/icao/#{icao_code}", {}, options), 'airports'
      end

      def by_icao_code_on_date(icao_code, year, month, day, options = {})
        from_response API.get("#{base_path}/icao/#{icao_code}/#{year}/#{month}/#{day}", {}, options), 'airport'
      end

      def within_radius(longitude, latitude, radius_miles, options = {})
        from_response API.get("#{base_path}/withinRadius/#{longitude}/#{latitude}/#{radius_miles}", {}, options), 'airports'
      end

      def base_path
        @@base_path
      end
    end
  end
end