class Item < ApplicationRecord
  #before_destroy :not_referenced_by_any_order_item
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  belongs_to :user, optional: true
  has_one_attached :image

  # def not_refereced_by_any_order_item
  #   unless order_items.empty?
  #     errors.add(:base, "Order items present")
  #     throw :abort
  #   end
  # end
end
