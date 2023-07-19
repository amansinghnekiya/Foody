class RemoveColumnsFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :item_id, :integer
    remove_column :order_items, :cart_id, :integer
  end
end
