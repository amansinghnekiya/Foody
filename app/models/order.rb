class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 50 } 

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "email", "id", "name", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order_items", "user"]
  end

end
