require 'rails_helper'
RSpec.describe TeachController, type: :controller do
  describe "GET index" do
    it "should return 200 when user logged in" do
      sign_in create(:user)
      get :index
      expect(response.status).to eq(200)
    end

    it "should redirect to log in page when user not logged in" do
      get :index
      expect(redirect_to new_user_session_path)
    end
  end
end
