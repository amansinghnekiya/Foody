require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @valid_room = Room.new(name: "Contact us")
  end

  describe 'name' do
    it 'validates uniqueness of a name' do
      @valid_room.save
      new_room = @valid_room.dup
      new_room.valid?
      expect(new_room.errors[:name]).to include('has already been taken')
    end
  end
end
