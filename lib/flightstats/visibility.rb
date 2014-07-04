module FlightStats
  class Visibility < Resource
    attr_accessor :miles,
                  :cavok,
                  :less_than
  end
end