require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "POST /restaurants/:restaurant_id/items" do
    it "creates a new message" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      room = Room.create(name: "Contact us")
      message = Message.create(content: "Hello", user_id: user.id, room_id: room.id)
      sign_in user
      post room_messages_path(room, message)
      expect(response).to have_http_status(302)
    end
  end
end
