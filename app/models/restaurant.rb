class Restaurant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :order_items
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 500 }
end
