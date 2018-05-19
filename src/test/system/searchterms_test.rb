require "application_system_test_case"

class SearchtermsTest < ApplicationSystemTestCase
  setup do
    @searchterm = searchterms(:one)
  end

  test "visiting the index" do
    visit searchterms_url
    assert_selector "h1", text: "Searchterms"
  end

  test "creating a Searchterm" do
    visit searchterms_url
    click_on "New Searchterm"

    fill_in "Search Term", with: @searchterm.search_term
    fill_in "User", with: @searchterm.user_id
    click_on "Create Searchterm"

    assert_text "Searchterm was successfully created"
    click_on "Back"
  end

  test "updating a Searchterm" do
    visit searchterms_url
    click_on "Edit", match: :first

    fill_in "Search Term", with: @searchterm.search_term
    fill_in "User", with: @searchterm.user_id
    click_on "Update Searchterm"

    assert_text "Searchterm was successfully updated"
    click_on "Back"
  end

  test "destroying a Searchterm" do
    visit searchterms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Searchterm was successfully destroyed"
  end
end
