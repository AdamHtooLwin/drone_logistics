class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :completed_datetime
      t.references :address, foreign_key: true
      t.string :status
      t.float :weight
      t.references :customer, foreign_key: true
      t.references :staff, foreign_key: true
      t.references :drone, foreign_key: true
      t.datetime :assigned_datetime
      t.datetime :shipped_datetime
      t.datetime :estimated_arrival
      t.float :item_weight
      t.float :length
      t.float :breadth
      t.float :height
      t.float :estimated_value
      t.text :description

      t.timestamps
    end
  end
end
