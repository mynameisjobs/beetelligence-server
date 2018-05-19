require "application_system_test_case"

class NexttimeslotsTest < ApplicationSystemTestCase
  setup do
    @nexttimeslot = nexttimeslots(:one)
  end

  test "visiting the index" do
    visit nexttimeslots_url
    assert_selector "h1", text: "Nexttimeslots"
  end

  test "creating a Nexttimeslot" do
    visit nexttimeslots_url
    click_on "New Nexttimeslot"

    fill_in "Latitude", with: @nexttimeslot.latitude
    fill_in "Longitude", with: @nexttimeslot.longitude
    fill_in "Store", with: @nexttimeslot.store_id
    click_on "Create Nexttimeslot"

    assert_text "Nexttimeslot was successfully created"
    click_on "Back"
  end

  test "updating a Nexttimeslot" do
    visit nexttimeslots_url
    click_on "Edit", match: :first

    fill_in "Latitude", with: @nexttimeslot.latitude
    fill_in "Longitude", with: @nexttimeslot.longitude
    fill_in "Store", with: @nexttimeslot.store_id
    click_on "Update Nexttimeslot"

    assert_text "Nexttimeslot was successfully updated"
    click_on "Back"
  end

  test "destroying a Nexttimeslot" do
    visit nexttimeslots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nexttimeslot was successfully destroyed"
  end
end
