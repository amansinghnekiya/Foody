require 'rails_helper'

RSpec.describe "Carts", type: :request do
  
  describe "POST #create" do
      it "works!" do
        get new_cart_path
        expect(response).to have_http_status(302)
      end

      it "creates a new cart" do
        post carts_path
        expect(response).to have_http_status(302)
      end
  end

  describe "GET /carts/:id" do
    it "get cart response" do
      cart = Cart.create
      get cart_path(id:cart.id)
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE /carts/:id" do
    it "delete cart response" do
      cart = Cart.create
      delete cart_path(id:cart.id)
      expect(response).to have_http_status(302)
    end
  end

end
