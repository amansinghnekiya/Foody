class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  belongs_to :user, optional: true
  has_one_attached :image

end
