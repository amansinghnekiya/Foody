require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @valid_order = Order.new(name: 'Aman Singh Nekiyaaaa', email: 'aman.singh@gmail.com', address: '1234 Elm Street, Apartment 5, Springfield, IL 62701, USA' )
    @invalid_order = Order.new(name: '', email: '', address: '' )
    @invalid_name = Order.new(name: 'Aman Singh Nekiyaaaa ', email: 'aman.singh@gmail.com', address: '1234 Elm Street, Apartment 5, Springfield, IL 62701, USA' )
    @invalid_email = Order.new(name: 'Aman Singh Nekiyaaaa ', email: 'aman.singh@gmail.com ', address: '1234 Elm Street, Apartment 5, Springfield, IL 62701, USA' )
    @invalid_address = Order.new(name: 'Aman Singh Nekiyaaaa ', email: 'aman.singh@gmail.com ', address: '1234 Elm Street, Apartment 5, Springfield, IL 62701, USA ' )
  end

  describe 'name' do
    it 'validates presence of name' do
      order = @invalid_order
      order.valid?
      expect(order.errors[:name]).to include("can't be blank")
    end

    it 'checks for validity of a name' do
      order = @invalid_name
      order.valid?
      expect(order.errors[:name]).to include("is too long (maximum is 20 characters)")
    end
  end

  describe 'email' do
    it 'validates presence of email' do
      order = @invalid_order
      order.valid?
      expect(order.errors[:email]).to include("can't be blank")
    end

    it 'checks for validity of a name' do
      order = @invalid_email
      order.valid?
      expect(order.errors[:email]).to include("is too long (maximum is 20 characters)")
    end
  end

  describe 'address' do
    it 'validates presence of address' do
      order = @invalid_order
      order.valid?
      expect(order.errors[:address]).to include("can't be blank")
    end

    it 'checks for validity of a address' do
      order = @invalid_address
      order.valid?
      expect(order.errors[:address]).to include("is too long (maximum is 50 characters)")
    end
  end
end
