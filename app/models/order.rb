class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 50 } 
end
