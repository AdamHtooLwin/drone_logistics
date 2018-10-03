class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :road
      t.string :district
      t.string :city
      t.float :gps_latitude
      t.float :gps_longitude
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
