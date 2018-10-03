class RemoveItemWeightFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :item_weight, :float
  end
end
