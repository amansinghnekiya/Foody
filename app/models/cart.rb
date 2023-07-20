class Cart < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items

  def add_item(item)
    existing_restaurant_id = order_items.pluck(:restaurant_id).uniq.first
    if existing_restaurant_id && existing_restaurant_id != item.restaurant_id
      raise "Cannot add items from different restaurants to the same order."
    end
    current_item = order_items.find_by(item_id: item.id)
    restaurant = item.restaurant
    if current_item 
      current_item.increment(:quantity)
    else
      current_item = order_items.build(item_id: item.id, restaurant_id: restaurant.id)
    end
    current_item   
  end

  def total_price
      order_items.to_a.sum { |item| item.total_price }
  end
end
