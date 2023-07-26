class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  after_create_commit { broadcast_append_to self.room }

  validates :user_id, presence: true
  validates :room_id, presence: true
end
