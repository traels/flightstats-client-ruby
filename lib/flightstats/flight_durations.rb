module FlightStats
  class FlightDurations < Resource
    attr_accessor :scheduled_block_minutes,
                  :scheduled_air_minutes,
                  :scheduled_taxi_out_minutes,
                  :scheduled_taxi_in_minutes,
                  :block_minutes,
                  :air_minutes,
                  :taxi_out_minutes,
                  :taxi_in_minutes
  end
end