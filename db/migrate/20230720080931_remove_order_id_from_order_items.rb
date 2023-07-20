class RemoveOrderIdFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :order_id, :integer
  end
end
