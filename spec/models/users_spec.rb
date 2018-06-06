require 'rails_helper'
RSpec.describe User, type: :model do
    before :all do
        @user = build_stubbed(:user)
    end

    it 'must have an email' do
        expect(@user.email).to eq('igorfratelsantana@gmail.com')
    end
    it 'must have a password' do
        expect(@user.password).to eq('#$taawktljasktlw4aaglj')
    end
    it 'must have an username' do
        expect(@user.username).to eq('igorfratel')
    end
end
