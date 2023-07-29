require 'rails_helper'

RSpec.describe "Restaurants", type: :request do
  describe "GET /restaurants" do
    it "list all restaurants" do
      get restaurants_url
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /restaurants/:id" do
    it "get restaurant response" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      get restaurant_path(id:restaurant.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /restaurants/:restaurant_id/items" do
    it "works!" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      get new_restaurant_path
      expect(response).to have_http_status(302)
    end

    it "creates a new restaurant" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      sign_in user
      post restaurants_path(restaurant)
      expect(response).to have_http_status(302)
    end
  end

  describe "UPDATE /restaurants/:id/edit" do
    it "works!" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      get edit_restaurant_path(restaurant)
      expect(response).to have_http_status(302)
    end

    it "updates a new restaurant" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      sign_in user
      put restaurants_path(restaurant)
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE /restaurants/:id" do
    it "delete restaurant response" do
      user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
      delete restaurant_path(restaurant)
      expect(response).to have_http_status(302)
    end
  end

end
