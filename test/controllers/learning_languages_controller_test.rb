require 'test_helper'

class LearningLanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learning_language = learning_languages(:one)
  end

  test "should get index" do
    get learning_languages_url
    assert_response :success
  end

  test "should get new" do
    get new_learning_language_url
    assert_response :success
  end

  test "should create learning_language" do
    assert_difference('LearningLanguage.count') do
      post learning_languages_url, params: { learning_language: { language: @learning_language.language, user_id: @learning_language.user_id } }
    end

    assert_redirected_to learning_language_url(LearningLanguage.last)
  end

  test "should show learning_language" do
    get learning_language_url(@learning_language)
    assert_response :success
  end

  test "should get edit" do
    get edit_learning_language_url(@learning_language)
    assert_response :success
  end

  test "should update learning_language" do
    patch learning_language_url(@learning_language), params: { learning_language: { language: @learning_language.language, user_id: @learning_language.user_id } }
    assert_redirected_to learning_language_url(@learning_language)
  end

  test "should destroy learning_language" do
    assert_difference('LearningLanguage.count', -1) do
      delete learning_language_url(@learning_language)
    end

    assert_redirected_to learning_languages_url
  end
end
