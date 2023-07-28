require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @invalid_item = Item.new(name: '' ,price: '', restaurant_id: '', user_id: '')
    @valid_item = Item.new(name: 'Shree Leela Gurukrip' ,price: '100.00', restaurant_id: '1', user_id: '1')
    @invalid_price = Item.new(name: 'Shree Leela Gurukrip' ,price: '0.00', restaurant_id: '1', user_id: '1')
    @invalid_name = Item.new(name: 'Shree Leela Gurukripa' ,price: '100.00', restaurant_id: '1', user_id: '1')
  end

  describe 'name' do
    it 'validates presence of name' do
      item = @invalid_item
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it 'checks for validity of a name' do
      item = @invalid_name
      item.valid?
      expect(item.errors[:name]).to include('is too long (maximum is 20 characters)')
    end
  end

  describe 'price' do
    it 'validates presence of a price' do
      item = @invalid_item
      item.valid?
      expect(item.errors[:price]).to include("is not a number")
    end

    it 'checks for validity of a price' do
      item = @invalid_price
      item.valid?
      expect(item.errors[:price]).to include('must be greater than or equal to 0.01')
    end
  end

  describe 'user_id' do
    it 'validates presence of a user_id' do
      item = @invalid_item
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end
  end
  
  describe 'restaurant_id' do
    it 'validates presence of a restaurant_id' do
      item = @invalid_item
      item.valid?
      expect(item.errors[:restaurant_id]).to include("can't be blank")
    end
  end
end
