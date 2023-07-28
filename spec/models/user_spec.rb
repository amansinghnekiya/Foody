require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model testing" do
    it "validates user instance" do
      user = User.new(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
      expect(user).to be_valid
    end
  end 

  before do
    @invalid_user = User.new(name: '', email: '', role: '', password: '')
    @valid_user = User.new(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
  end

  describe 'name' do
    it 'validates presence of name' do
      user = @invalid_user
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end
