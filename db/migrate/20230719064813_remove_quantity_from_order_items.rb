class RemoveQuantityFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :quantity, :integer
  end
end
