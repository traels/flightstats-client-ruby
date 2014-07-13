module FlightStats
  class RunwayVisualRange < Resource
    attr_accessor :runway_number,
                  :modifier,
                  :lowest_visibility,
                  :highest_visibility
  end
end