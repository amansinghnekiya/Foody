require 'rails_helper'

RSpec.describe "OrderItems", type: :request do
  
  describe "POST /order_items/new" do
    it "works!" do
      get  new_order_item_path
      expect(response).to have_http_status(302)
    end

    it "creates a new order_item" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      cart = Cart.create
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      item = Item.create(name: "Samosa", price: '15', user_id: user.id, restaurant_id: restaurant.id)
      order_item = OrderItem.create(restaurant_id: restaurant.id, item_id: item.id, cart_id: cart.id)
      sign_in user
      post order_items_path(order_item)
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE  /order_items/:id" do
    it "delete order_item response" do
      cart = Cart.create
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      item = Item.create(name: "Samosa", price: '15', user_id: user.id, restaurant_id: restaurant.id)
      order_item = OrderItem.create(restaurant_id: restaurant.id, item_id: item.id, cart_id: cart.id)
      delete order_item_path(order_item)
      expect(response).to have_http_status(302)
    end
  end
end
