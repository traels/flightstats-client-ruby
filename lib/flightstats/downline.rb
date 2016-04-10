module FlightStats
  class Downline < Resource
    attr_accessor :arrival_airport,
                  :fs_code,
                  :flight_id
  end
end