module FlightStats
  class UpdatedDateField < Resource
    attr_accessor :field,
                  :original_date_local,
                  :new_date_local
  end
end