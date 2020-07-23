class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :license
      t.string :license_type
      t.string :name
      t.jsonb :address
      t.string :phone
      t.float :latitude
      t.float :longitude
      t.boolean :beer
      t.boolean :wine
      t.boolean :liquor

      t.timestamps
    end
  end
end
