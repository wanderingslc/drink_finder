require 'faker'
Faker::Config.locale = "en-US"

types = ["BC", "BE", "CL", "PS", "RB", "RL", "RE", "TV"]

10.times do 
  Location.create({
    license: "#{types.sample}#{Faker::Alphanumeric.alphanumeric(number: 8)}",
    license_type: '',
    name: Faker::Company.name, 
    address: {
      street_address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip,
    },
    phone: Faker::PhoneNumber.phone_number,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    beer: false,
    wine: false,
    liquor: false,
  })
end