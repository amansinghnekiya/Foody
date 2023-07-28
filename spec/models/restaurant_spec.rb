require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before do
    @valid_restaurant = Restaurant.new(name: 'A' * 40, description: 'A'*500)
    @invalid_restaurant = Restaurant.new(name: '', description: '')
    @invalid_name = Restaurant.new(name: 'A' * 41, description: 'A'*500)
    @invalid_description = Restaurant.new(name: 'A' * 41, description: 'A'*501)
  end

  describe 'name' do
    it 'validates presence of name' do
      restaurant = @invalid_restaurant
      restaurant.valid?
      expect(restaurant.errors[:name]).to include("can't be blank")
    end

    it 'checks for validity of a name' do
      restaurant = @invalid_name
      restaurant.valid?
      expect(restaurant.errors[:name]).to include("is too long (maximum is 40 characters)")
    end
  end

  describe 'description' do
    it 'validates presence of description' do
      restaurant = @invalid_restaurant
      restaurant.valid?
      expect(restaurant.errors[:description]).to include("can't be blank")
    end

    it 'checks for validity of a description' do
      restaurant = @invalid_description
      restaurant.valid?
      expect(restaurant.errors[:description]).to include("is too long (maximum is 500 characters)")
    end
  end
end
