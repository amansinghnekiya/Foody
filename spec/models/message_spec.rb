require 'rails_helper'

RSpec.describe Message, type: :model do

  before do
    @invalid_message = Message.new(user_id: '', room_id: '')
  end

  describe 'user_id' do
    it 'validates presence of user_id' do
      message = @invalid_message
      message.valid?
      expect(message.errors[:user_id]).to include("can't be blank")
    end
  end

  describe 'room_id' do
    it 'validates presence of room_id' do
      message = @invalid_message
      message.valid?
      expect(message.errors[:room_id]).to include("can't be blank")
    end
  end
end
