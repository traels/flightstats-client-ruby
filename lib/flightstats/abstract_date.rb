module FlightStats
  class AbstractDate < Resource
    attr_accessor :date_local,
                  :date_utc
  end
end