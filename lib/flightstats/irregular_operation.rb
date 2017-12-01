module FlightStats
  class IrregularOperation < Resource
    attr_accessor :type,
                  :new_arrival_airport_fs_code,
                  :related_flight_id,
                  :date_utc,
                  :message
  end
end