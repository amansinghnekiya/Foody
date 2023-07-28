require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /restaurants/:restaurant_id/items/:id" do
    it "get item response" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      item = Item.create(name: "Samosa", price: '15', user_id: user.id, restaurant_id: restaurant.id)
      get  restaurant_item_path(restaurant, item)
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /restaurants/:restaurant_id/items" do
    it "works!" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      get new_restaurant_item_path(restaurant)
      expect(response).to have_http_status(302)
    end

    it "creates a new item" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      item = Item.create(name: "Samosa", price: '15', user_id: user.id, restaurant_id: restaurant.id)
      sign_in user
      post restaurant_items_path(restaurant, item)
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE /restaurants/:restaurant_id/items/:id" do
    it "delete item response" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      item = Item.create(name: "Samosa", price: '15', user_id: user.id, restaurant_id: restaurant.id)
      delete restaurant_item_path(restaurant, item)
      expect(response).to have_http_status(302)
    end
  end

  describe "UPDATE /restaurants/:restaurant_id/items/:id" do
    it "works!" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      item = Item.create(name: "Samosa", price: '15', user_id: user.id, restaurant_id: restaurant.id)
      get edit_restaurant_item_path(restaurant, item)
      expect(response).to have_http_status(302)
    end

    it "updates a new item" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      item = Item.create(name: "Samosa", price: '15', user_id: user.id, restaurant_id: restaurant.id)
      sign_in user
      put restaurant_items_path(restaurant, item)
      expect(response).to have_http_status(302)
    end
  end


end
