require 'test_helper'

class CompetitorPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competitor_price = competitor_prices(:one)
  end

  test "should get index" do
    get competitor_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_competitor_price_url
    assert_response :success
  end

  test "should create competitor_price" do
    assert_difference('CompetitorPrice.count') do
      post competitor_prices_url, params: { competitor_price: { imageurl: @competitor_price.imageurl, price: @competitor_price.price, source: @competitor_price.source, title: @competitor_price.title, update_at: @competitor_price.update_at, url: @competitor_price.url } }
    end

    assert_redirected_to competitor_price_url(CompetitorPrice.last)
  end

  test "should show competitor_price" do
    get competitor_price_url(@competitor_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_competitor_price_url(@competitor_price)
    assert_response :success
  end

  test "should update competitor_price" do
    patch competitor_price_url(@competitor_price), params: { competitor_price: { imageurl: @competitor_price.imageurl, price: @competitor_price.price, source: @competitor_price.source, title: @competitor_price.title, update_at: @competitor_price.update_at, url: @competitor_price.url } }
    assert_redirected_to competitor_price_url(@competitor_price)
  end

  test "should destroy competitor_price" do
    assert_difference('CompetitorPrice.count', -1) do
      delete competitor_price_url(@competitor_price)
    end

    assert_redirected_to competitor_prices_url
  end
end
