require "application_system_test_case"

class AuthorCommentPostsTest < ApplicationSystemTestCase
  setup do
    @author_comment_post = author_comment_posts(:one)
  end

  test "visiting the index" do
    visit author_comment_posts_url
    assert_selector "h1", text: "Author Comment Posts"
  end

  test "creating a Author comment post" do
    visit author_comment_posts_url
    click_on "New Author Comment Post"

    fill_in "Comment", with: @author_comment_post.comment_id
    fill_in "Post", with: @author_comment_post.post_id
    fill_in "User", with: @author_comment_post.user_id
    click_on "Create Author comment post"

    assert_text "Author comment post was successfully created"
    click_on "Back"
  end

  test "updating a Author comment post" do
    visit author_comment_posts_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @author_comment_post.comment_id
    fill_in "Post", with: @author_comment_post.post_id
    fill_in "User", with: @author_comment_post.user_id
    click_on "Update Author comment post"

    assert_text "Author comment post was successfully updated"
    click_on "Back"
  end

  test "destroying a Author comment post" do
    visit author_comment_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Author comment post was successfully destroyed"
  end
end
