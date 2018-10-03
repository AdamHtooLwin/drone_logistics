class CreateDrones < ActiveRecord::Migration[5.2]
  def change
    create_table :drones do |t|
      t.string :name
      t.string :status
      t.float :carrying_capacity
      t.float :price
      t.date :acquired_date
      t.float :weight

      t.timestamps
    end
  end
end
