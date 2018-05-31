class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @acp = AuthorCommentPost.where(post_id: Bookmark.where(:user_id => current_user.id).pluck(:post_id)).includes(:user, :post, :comment).order("created_at DESC")
  end
end
