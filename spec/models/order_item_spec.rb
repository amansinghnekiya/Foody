require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before do
    @invalid_order_item = OrderItem.new(cart_id: '' , restaurant_id: '', item_id: '')
    @valid_order_item = OrderItem.new(cart_id: '1' , restaurant_id: '1', item_id: '1')
  end

  describe 'cart_id' do
    it 'validates presence of cart_id' do
      order_item = @invalid_order_item
      order_item.valid?
      expect(order_item.errors[:cart_id]).to include("can't be blank")
    end
  end

  describe 'item_id' do
    it 'validates presence of item_id' do
      order_item = @invalid_order_item
      order_item.valid?
      expect(order_item.errors[:item_id]).to include("can't be blank")
    end
  end

  describe 'restaurant_id' do
    it 'validates presence of restaurant_id' do
      order_item = @invalid_order_item
      order_item.valid?
      expect(order_item.errors[:restaurant_id]).to include("can't be blank")
    end
  end
end
