require 'test_helper'

class AuthorCommentPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author_comment_post = author_comment_posts(:one)
  end

  test "should get index" do
    get author_comment_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_author_comment_post_url
    assert_response :success
  end

  test "should create author_comment_post" do
    assert_difference('AuthorCommentPost.count') do
      post author_comment_posts_url, params: { author_comment_post: { comment_id: @author_comment_post.comment_id, post_id: @author_comment_post.post_id, user_id: @author_comment_post.user_id } }
    end

    assert_redirected_to author_comment_post_url(AuthorCommentPost.last)
  end

  test "should show author_comment_post" do
    get author_comment_post_url(@author_comment_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_comment_post_url(@author_comment_post)
    assert_response :success
  end

  test "should update author_comment_post" do
    patch author_comment_post_url(@author_comment_post), params: { author_comment_post: { comment_id: @author_comment_post.comment_id, post_id: @author_comment_post.post_id, user_id: @author_comment_post.user_id } }
    assert_redirected_to author_comment_post_url(@author_comment_post)
  end

  test "should destroy author_comment_post" do
    assert_difference('AuthorCommentPost.count', -1) do
      delete author_comment_post_url(@author_comment_post)
    end

    assert_redirected_to author_comment_posts_url
  end
end
