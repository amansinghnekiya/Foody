class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :restaurant
  belongs_to :order, optional: true

  validates :restaurant_id, presence: true
  validates :item_id, presence: true
  validates :cart_id, presence: true
    

  def total_price
    item.price.to_i * quantity.to_i
  end

  def self.ransackable_attributes(auth_object = nil)
    ["cart_id", "created_at", "id", "item_id", "order_id", "quantity", "restaurant_id", "updated_at"]
  end

  
end
