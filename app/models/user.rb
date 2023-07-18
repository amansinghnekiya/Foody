class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 

  validates :name, presence: true
  enum role: { basic_account: 0, bussiness_account: 1}
  validates :role, inclusion: { in: roles.keys }
  has_many :restaurants

end
