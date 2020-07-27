class Location < ApplicationRecord

  def street_address 
    "#{address['street_address']} #{address['city']} #{address['zip']}"
  end

  def get_all_locations 
    Location.all 
  end

  scope :get_all_wine, -> {Location.all.where(wine: true)}
end
