require 'rails_helper'
RSpec.describe AuthorCommentPostsController, type: :controller do
  describe "create AuthorCommentPost" do
    it "should return 302 when user logged in" do
      created_post = create(:post)
      sign_in created_post.user
      comment = create(:comment)

      post :create, params: { author_comment_post: {user_id: created_post.user.id, post_id: created_post.id, comment_id: comment.id } }
      expect(response.status).to eq(302)
    end
  end
end
