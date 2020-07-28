class Location < ApplicationRecord
  geocoded_by :street_address 
  reverse_geocoded_by :latitude, :longitude 

  def street_address 
    "#{address['street_address']} #{address['city']} #{address['zip']}"
  end

  def get_all_locations 
    Location.all 
  end

  scope :get_all_wine, -> {Location.all.where(wine: true)}
end
