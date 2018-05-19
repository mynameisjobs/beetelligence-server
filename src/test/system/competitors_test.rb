require "application_system_test_case"

class CompetitorsTest < ApplicationSystemTestCase
  setup do
    @competitor = competitors(:one)
  end

  test "visiting the index" do
    visit competitors_url
    assert_selector "h1", text: "Competitors"
  end

  test "creating a Competitor" do
    visit competitors_url
    click_on "New Competitor"

    fill_in "Imageurl", with: @competitor.imageurl
    fill_in "Latitude", with: @competitor.latitude
    fill_in "Longitude", with: @competitor.longitude
    fill_in "Price", with: @competitor.price
    fill_in "Source", with: @competitor.source
    fill_in "Title", with: @competitor.title
    fill_in "Update At", with: @competitor.update_at
    fill_in "Url", with: @competitor.url
    fill_in "User", with: @competitor.user_id
    click_on "Create Competitor"

    assert_text "Competitor was successfully created"
    click_on "Back"
  end

  test "updating a Competitor" do
    visit competitors_url
    click_on "Edit", match: :first

    fill_in "Imageurl", with: @competitor.imageurl
    fill_in "Latitude", with: @competitor.latitude
    fill_in "Longitude", with: @competitor.longitude
    fill_in "Price", with: @competitor.price
    fill_in "Source", with: @competitor.source
    fill_in "Title", with: @competitor.title
    fill_in "Update At", with: @competitor.update_at
    fill_in "Url", with: @competitor.url
    fill_in "User", with: @competitor.user_id
    click_on "Update Competitor"

    assert_text "Competitor was successfully updated"
    click_on "Back"
  end

  test "destroying a Competitor" do
    visit competitors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Competitor was successfully destroyed"
  end
end
