module FlightStats
  class UpdatedTextField < Resource
    attr_accessor :field,
                  :original_text,
                  :new_text
  end
end