module FlightStats
  class Upline < Resource
    attr_accessor :departure_aiport,
                  :fs_code,
                  :flight_id
  end
end