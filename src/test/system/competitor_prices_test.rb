require "application_system_test_case"

class CompetitorPricesTest < ApplicationSystemTestCase
  setup do
    @competitor_price = competitor_prices(:one)
  end

  test "visiting the index" do
    visit competitor_prices_url
    assert_selector "h1", text: "Competitor Prices"
  end

  test "creating a Competitor price" do
    visit competitor_prices_url
    click_on "New Competitor Price"

    fill_in "Imageurl", with: @competitor_price.imageurl
    fill_in "Price", with: @competitor_price.price
    fill_in "Source", with: @competitor_price.source
    fill_in "Title", with: @competitor_price.title
    fill_in "Update At", with: @competitor_price.update_at
    fill_in "Url", with: @competitor_price.url
    click_on "Create Competitor price"

    assert_text "Competitor price was successfully created"
    click_on "Back"
  end

  test "updating a Competitor price" do
    visit competitor_prices_url
    click_on "Edit", match: :first

    fill_in "Imageurl", with: @competitor_price.imageurl
    fill_in "Price", with: @competitor_price.price
    fill_in "Source", with: @competitor_price.source
    fill_in "Title", with: @competitor_price.title
    fill_in "Update At", with: @competitor_price.update_at
    fill_in "Url", with: @competitor_price.url
    click_on "Update Competitor price"

    assert_text "Competitor price was successfully updated"
    click_on "Back"
  end

  test "destroying a Competitor price" do
    visit competitor_prices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Competitor price was successfully destroyed"
  end
end
