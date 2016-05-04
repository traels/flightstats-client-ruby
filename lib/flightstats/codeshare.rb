module FlightStats
  class Codeshare < Resource
    attr_accessor :fs_code,
                  :flight_number,
                  :carrier,
                  :relationship
  end
end