json.extract! location, :id, :license, :license_type, :name, :address, :phone, :latitude, :longitude, :beer, :wine, :liquor, :created_at, :updated_at
json.url location_url(location, format: :json)
