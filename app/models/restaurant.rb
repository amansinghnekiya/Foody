class Restaurant < ApplicationRecord

    has_many :items, dependent: :destroy

    validates :name, presence: true, length: { maximum: 15 }
    validates :description, presence: true, length: { maximum: 100 }
end
