require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(id: 1) }
  let(:friend) { User.new(id: 2) }
  let(:friendship) { Friendship.new(id: 1, user_id: 1, friend_id: 2, confirmed: false) }
  describe 'validation' do
    user = User.new(email: 'test@testing.com', name: 'test', password: '123456')
    it 'should not be valid user without name' do
      user.name = nil
      expect(User.new).to_not be_valid
    end

    it 'should be a valid user' do
      expect(User.new(name: 'test', email: 'test@testing.com', password: '123456')).to be_valid
    end
  end

  describe 'methods' do
    context 'friends' do
      it 'should return an array' do
        expect(user.friends).to be_an(Array)
      end
    end
    context 'pending_friends' do
      it 'should return an array' do
        expect(user.pending_friends).to be_an(Array)
      end
    end
    context 'friend_requests' do
      it 'should return an array' do
        expect(user.friend_requests).to be_an(Array)
      end
    end
    context 'friend?' do
      it 'should return a boolean' do
        expect(user.friend?(user)).to be_kind_of(FalseClass || TrueClass)
      end
    end
  end
end
