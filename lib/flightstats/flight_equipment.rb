module FlightStats
  class FlightEquipment < Resource
    attr_accessor :scheduled_equipment_iata_code,
                  :actual_equipment_iata_code,
                  :tail_number
  end
end