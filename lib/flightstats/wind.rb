module FlightStats
  class Wind < Resource
    attr_accessor :direction,
                  :direction_min,
                  :direction_max,
                  :direction_is_variable,
                  :speed_knots,
                  :gust_speed_knots
  end
end