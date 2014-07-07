module FlightStats
  class FidsData < Resource
    attr_accessor :flight_id,
                  :last_updated_time,
                  :last_updated_time_utc,
                  :last_updated_date,
                  :last_updated_date_utc,
                  :day_offset,
                  :status_code,
                  :airline_name,
                  :airline_code,
                  :flight_number,
                  :airline_logo_url_png,
                  :airline_logo_url_svg,
                  :is_codeshare,
                  :operated_flight_number,
                  :operating_airline_name,
                  :operating_airline_code,
                  :destination_airport_name,
                  :destination_airport_code,
                  :destination_city,
                  :destination_familiar_name,
                  :destination_state_code,
                  :destination_country_code,
                  :flight,
                  :delayed,
                  :remarks,
                  :remarks_with_time,
                  :remarks_code,
                  :airport_code,
                  :airport_name,
                  :city,
                  :gate,
                  :terminal,
                  :baggage,
                  :scheduled_time,
                  :scheduled_date,
                  :estimated_time,
                  :estimated_date,
                  :actual_time,
                  :actual_date,
                  :current_time,
                  :current_date,
                  :scheduled_gate_time,
                  :scheduled_gate_date,
                  :estimated_gate_time,
                  :estiamted_gate_date,
                  :actual_gate_time,
                  :actual_gate_date,
                  :current_gate_time,
                  :current_gate_date,
                  :codeshares_as_names,
                  :codeshares_as_codes,
                  :upline_airport_names,
                  :upline_airport_codes,
                  :downline_airport_names,
                  :downline_airport_codes,
                  :weather,
                  :temperature_c,
                  :temperature_f

    @@base_path = "/flex/fids/rest/v1/json"

    class << self
      def departing_from(departure_code, requested_fields, options = {})
        from_response API.get("#{base_path}/#{departure_code}/departures", { :requestedFields => requested_fields }, options), 'fidsData'
      end

      def arriving_at(arrival_code, requested_fields, options = {})
        from_response API.get("#{base_path}/#{arrival_code}/arrivals", {}, options), 'fidsData'
      end

      def base_path
        @@base_path
      end
    end
  end
end