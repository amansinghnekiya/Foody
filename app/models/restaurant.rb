class Restaurant < ApplicationRecord

    has_many :items, dependent: :destroy
    has_many :order_items, through: :items

    validates :name, presence: true, length: { maximum: 15 }
    validates :description, presence: true, length: { maximum: 100 }
end
