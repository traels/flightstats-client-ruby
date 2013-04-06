module FlightStats
  class FlightLeg < Resource
    attr_accessor :departure_airport_fs_code,
                  :arrival_airport_fs_code,
                  :departure_time,
                  :arrival_time,
                  :departure_date_adjustment,
                  :arrival_date_adjustment,
                  :departure_terminal,
                  :arrival_terminal,
                  :flight_number,
                  :codeshare,
                  :equipment_codes,
                  :distance_miles,
                  :flight_duration_minutes,
                  :layover_duration_minutes,
                  :operator,
                  :carrier_fs_code,
                  :wetlease_info

    def to_s
      "#{operator ? operator.carrier_fs_code : carrier_fs_code}#{flight_number}: #{departure_airport_fs_code} at #{departure_time} - #{arrival_airport_fs_code} at #{arrival_time} (+#{arrival_date_adjustment}) #{distance_miles} miles"
    end
  end
end