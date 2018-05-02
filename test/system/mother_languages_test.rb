require "application_system_test_case"

class MotherLanguagesTest < ApplicationSystemTestCase
  setup do
    @mother_language = mother_languages(:one)
  end

  test "visiting the index" do
    visit mother_languages_url
    assert_selector "h1", text: "Mother Languages"
  end

  test "creating a Mother language" do
    visit mother_languages_url
    click_on "New Mother Language"

    fill_in "Language", with: @mother_language.language
    fill_in "User", with: @mother_language.user_id
    click_on "Create Mother language"

    assert_text "Mother language was successfully created"
    click_on "Back"
  end

  test "updating a Mother language" do
    visit mother_languages_url
    click_on "Edit", match: :first

    fill_in "Language", with: @mother_language.language
    fill_in "User", with: @mother_language.user_id
    click_on "Update Mother language"

    assert_text "Mother language was successfully updated"
    click_on "Back"
  end

  test "destroying a Mother language" do
    visit mother_languages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mother language was successfully destroyed"
  end
end
