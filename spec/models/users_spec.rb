require 'rails_helper'
RSpec.describe User, type: :model do
    before :all do
        @user = build_stubbed(:user)
    end

    it 'is valid with valid attributes' do
        expect(@user).to be_valid
    end

    it 'is not valid without email' do
        user = build_stubbed(:user)
        user.email = nil
        expect(user).not_to be_valid
    end
    it 'is not valid without password' do
        user = build_stubbed(:user)
        user.password = nil
        expect(user).not_to be_valid
    end
    it 'is not valid without username' do
        user = build_stubbed(:user)
        user.username = nil
        expect(user).not_to be_valid
    end
end
