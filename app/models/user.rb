class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :name, presence: true

  validates_uniqueness_of :name
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }

  enum role: { basic_account: 0, bussiness_account: 1}
  validates :role, inclusion: { in: roles.keys }
  has_many :restaurants
  has_many :orders
  has_many :items
  has_many :messages


end
