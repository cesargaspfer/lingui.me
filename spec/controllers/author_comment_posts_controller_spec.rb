require 'rails_helper'
RSpec.describe AuthorCommentPostsController, type: :controller do
  describe "create authorCommentPost" do
    it "should redirect to login page when user not logged in" do
      post :create, :params => { :author_comment_post => {:user_id => 123}}
      expect(redirect_to new_user_session_path)
    end
  end
end
