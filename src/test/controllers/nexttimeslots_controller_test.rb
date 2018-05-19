require 'test_helper'

class NexttimeslotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nexttimeslot = nexttimeslots(:one)
  end

  test "should get index" do
    get nexttimeslots_url
    assert_response :success
  end

  test "should get new" do
    get new_nexttimeslot_url
    assert_response :success
  end

  test "should create nexttimeslot" do
    assert_difference('Nexttimeslot.count') do
      post nexttimeslots_url, params: { nexttimeslot: { latitude: @nexttimeslot.latitude, longitude: @nexttimeslot.longitude, store_id: @nexttimeslot.store_id } }
    end

    assert_redirected_to nexttimeslot_url(Nexttimeslot.last)
  end

  test "should show nexttimeslot" do
    get nexttimeslot_url(@nexttimeslot)
    assert_response :success
  end

  test "should get edit" do
    get edit_nexttimeslot_url(@nexttimeslot)
    assert_response :success
  end

  test "should update nexttimeslot" do
    patch nexttimeslot_url(@nexttimeslot), params: { nexttimeslot: { latitude: @nexttimeslot.latitude, longitude: @nexttimeslot.longitude, store_id: @nexttimeslot.store_id } }
    assert_redirected_to nexttimeslot_url(@nexttimeslot)
  end

  test "should destroy nexttimeslot" do
    assert_difference('Nexttimeslot.count', -1) do
      delete nexttimeslot_url(@nexttimeslot)
    end

    assert_redirected_to nexttimeslots_url
  end
end
