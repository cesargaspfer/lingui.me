require 'rails_helper'
RSpec.describe AskController, type: :controller do
  describe "GET index" do
    it "should return 200 when user logged in" do
      sign_in create(:user)
      get :index
      expect(response.status).to eq(200)
    end

    it "should redirect when user not logged in" do
      get :index
      expect(response.status).to eq(302)
    end

    it "should redirect to log in page when user not logged in" do
      get :index
      expect(redirect_to new_user_session_path)
    end
  end

  describe "Creating Post" do
    it "should redirect to log in page when user not logged in" do
      ask = build_stubbed(:post)
      post :create, :params => {:ask => {:difficulty => ask.difficulty, :learning_language => ask.learning_language, :mother_language => ask.mother_language, :text => ask.text, :title => ask.title}}

      expect(redirect_to new_user_session_path)
    end

    it "should redirect to post page when params are valid" do
      user = create(:user)
      ask = build_stubbed(:post)
      sign_in user
      post :create, :params => {:ask => {:difficulty => ask.difficulty, :learning_language => ask.learning_language, :mother_language => ask.mother_language, :text => ask.text, :title => ask.title}}
      response.should redirect_to '/posts/1'
    end

    it "should render ask index page when params are invalid" do
      user = create(:user)
      ask = build_stubbed(:post)
      sign_in user
      post :create, :params => {:ask => {:difficulty => ask.difficulty, :learning_language => ask.learning_language, :text => ask.text, :title => ask.title}}

      expect(response).to render_template(:index)
    end
  end
end
