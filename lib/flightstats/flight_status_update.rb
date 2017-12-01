module FlightStats
  class FlightStatusUpdate < Resource
    attr_accessor :updated_at,
                  :source,
                  :updated_text_fields,
                  :updated_date_fields
  end
end