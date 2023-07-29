require 'rails_helper'

RSpec.describe "Orders", type: :request do

  describe "GET /orders" do
    it "list all orders" do
      get orders_url
      expect(response).to have_http_status(302)
    end
  end
  
  describe "GET /orders/:id" do
    it "get order response" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      order = Order.create(name: "Aman", email: "aman@gmail.com", address: "Indore", user_id: user.id)
      get order_path(id:order.id)
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /orders" do
    it "works!" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      order = Order.create(name: "Aman", email: "aman@gmail.com", address: "Indore", user_id: user.id)
      get new_order_path
      expect(response).to have_http_status(302)
    end

    it "creates a new order" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      order = Order.create(name: "Aman", email: "aman@gmail.com", address: "Indore", user_id: user.id)
      sign_in user
      post orders_path(order)
      expect(response).to have_http_status(302)
    end
  end
end
