require 'test_helper'

class CompetitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competitor = competitors(:one)
  end

  test "should get index" do
    get competitors_url
    assert_response :success
  end

  test "should get new" do
    get new_competitor_url
    assert_response :success
  end

  test "should create competitor" do
    assert_difference('Competitor.count') do
      post competitors_url, params: { competitor: { imageurl: @competitor.imageurl, latitude: @competitor.latitude, longitude: @competitor.longitude, price: @competitor.price, source: @competitor.source, title: @competitor.title, update_at: @competitor.update_at, url: @competitor.url, user_id: @competitor.user_id } }
    end

    assert_redirected_to competitor_url(Competitor.last)
  end

  test "should show competitor" do
    get competitor_url(@competitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_competitor_url(@competitor)
    assert_response :success
  end

  test "should update competitor" do
    patch competitor_url(@competitor), params: { competitor: { imageurl: @competitor.imageurl, latitude: @competitor.latitude, longitude: @competitor.longitude, price: @competitor.price, source: @competitor.source, title: @competitor.title, update_at: @competitor.update_at, url: @competitor.url, user_id: @competitor.user_id } }
    assert_redirected_to competitor_url(@competitor)
  end

  test "should destroy competitor" do
    assert_difference('Competitor.count', -1) do
      delete competitor_url(@competitor)
    end

    assert_redirected_to competitors_url
  end
end
