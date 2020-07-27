

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

      if row['license'].include? "BC"
        location.beer = true
        location.license_type = "Banquet Catering"
      end
      if row['license'].include? 'BE'
        location.beer = true
        location.license_type = "On Premise Beer"
      end

      if row['license'].include? 'CL'
        location.liquor = true
        location.license_type = "Private Club"
      end

      if row['license'].include? 'PS'
        location.beer = true
        location.license_type = 'Public Service Permit'
      end

      if row['license'].include? 'RB'
        location.beer = true
        location.license_type = 'Restaurant - Beer Only'
      end

      if row['license'].include? 'RL'
        location.wine = true
        location.license_type = 'Restaurant - Limited Service'
      end

      if row['license'].include? 'RE'
        location.liquor = true
        location.license_type = 'Restaurant - Full Service'
      end

      if row['license'].include? 'TV'
        location.beer = true
        location.license_type = 'Tavern'
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