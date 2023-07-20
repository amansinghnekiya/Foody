class AddRestaurantIdToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :restaurant, null: true, foreign_key: true
  end
end
