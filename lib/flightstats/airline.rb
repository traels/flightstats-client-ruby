module FlightStats
  class Airline < Resource
    attr_accessor :fs,
                  :iata,
                  :icao,
                  :name,
                  :phone_number,
                  :active
  end
end