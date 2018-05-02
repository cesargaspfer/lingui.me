require 'test_helper'

class MotherLanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mother_language = mother_languages(:one)
  end

  test "should get index" do
    get mother_languages_url
    assert_response :success
  end

  test "should get new" do
    get new_mother_language_url
    assert_response :success
  end

  test "should create mother_language" do
    assert_difference('MotherLanguage.count') do
      post mother_languages_url, params: { mother_language: { languages: @mother_language.languages, user_id: @mother_language.user_id } }
    end

    assert_redirected_to mother_language_url(MotherLanguage.last)
  end

  test "should show mother_language" do
    get mother_language_url(@mother_language)
    assert_response :success
  end

  test "should get edit" do
    get edit_mother_language_url(@mother_language)
    assert_response :success
  end

  test "should update mother_language" do
    patch mother_language_url(@mother_language), params: { mother_language: { languages: @mother_language.languages, user_id: @mother_language.user_id } }
    assert_redirected_to mother_language_url(@mother_language)
  end

  test "should destroy mother_language" do
    assert_difference('MotherLanguage.count', -1) do
      delete mother_language_url(@mother_language)
    end

    assert_redirected_to mother_languages_url
  end
end
