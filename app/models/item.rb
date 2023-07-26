class Item < ApplicationRecord
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy
  belongs_to :user, optional: true
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, numericality: { only_integer: true }
  validates :user_id, presence: true
  validates :restaurant_id, presence: true

end
