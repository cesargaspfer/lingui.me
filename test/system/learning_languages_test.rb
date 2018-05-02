require "application_system_test_case"

class LearningLanguagesTest < ApplicationSystemTestCase
  setup do
    @learning_language = learning_languages(:one)
  end

  test "visiting the index" do
    visit learning_languages_url
    assert_selector "h1", text: "Learning Languages"
  end

  test "creating a Learning language" do
    visit learning_languages_url
    click_on "New Learning Language"

    fill_in "Language", with: @learning_language.language
    fill_in "User", with: @learning_language.user_id
    click_on "Create Learning language"

    assert_text "Learning language was successfully created"
    click_on "Back"
  end

  test "updating a Learning language" do
    visit learning_languages_url
    click_on "Edit", match: :first

    fill_in "Language", with: @learning_language.language
    fill_in "User", with: @learning_language.user_id
    click_on "Update Learning language"

    assert_text "Learning language was successfully updated"
    click_on "Back"
  end

  test "destroying a Learning language" do
    visit learning_languages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Learning language was successfully destroyed"
  end
end
