

class Import < ApplicationRecord 
  def self.import_csv file 
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      if row["dba"].nil? || row["license"].nil? 
        next
      end

      license = row["license"]
      location = Location.create_or_find_by(license: row["license"])

      row.delete(nil)
   
      licenseCode = license[0..1]
     
      case licenseCode
      when "AL"
        location.license_type = "Airport Lounge"
        location.liquor = true 
        location.wine = true 
        location.beer = true
        location.heavy_beer = true
      when "BC"
        location.license_type = "Banquet Catering"
        location.liquor = true 
        location.wine = true 
        location.beer = true
        location.heavy_beer = true
      when "BE" 
        location.license_type = "On Premise Beer"
        location.beer = true
        location.heavy_beer = true
      when "OP"
        location.license_type = "Off Premise Beer"
        location.beer = true
      when "PS"
        location.license_type = "Public Service Permit"

      when "RB"
        location.license_type = "Restaurant(Beer Only"
        location.beer = true
      when "TV"
        location.license_type = "Tavern"
        location.beer = true
      when "CL"
        location.license_type = "Private Club"
        location.beer = true 
        location.heavy_beer = true 
        location.wine = true 
        location.liquor = true
      when "RE"
        location.license_type = "Restaurant(Full Service)"
        location.beer = true 
        location.heavy_beer = true 
        location.wine = true 
        location.liquor = true
      when "RL"
        location.license_type = "Restaurant(Limited Service)"
        location.beer = true 
        location.heavy_beer = true 
        location.wine = true
      when "LR"
        location.license_type = "Restaurant(Full Service)"
        location.beer = true 
        location.heavy_beer = true 
        location.wine = true 
        location.liquor = true 
      when "LB" 
        location.license_type = "Bar Establishment"
        location.liquor = true 
        location.wine = true 
        location.beer = true
        location.heavy_beer = true
      when "HL"
        location.license_type = "Hotel"
        location.liquor = true 
        location.wine = true 
        location.beer = true
        location.heavy_beer = true
      else 
        location.license_type = "Not Listed"
      end

      location.license = row["license"]
      location.name = row["dba"]
      location.address = {
        street_address: row['address'],
        city: row['city'],
        state: row['state'],
        zip: row['zip']
      }
      location.phone = row['phone']
      location.save!
    end
  end
end