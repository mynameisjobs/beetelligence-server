require 'test_helper'

class SearchtermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @searchterm = searchterms(:one)
  end

  test "should get index" do
    get searchterms_url
    assert_response :success
  end

  test "should get new" do
    get new_searchterm_url
    assert_response :success
  end

  test "should create searchterm" do
    assert_difference('Searchterm.count') do
      post searchterms_url, params: { searchterm: { search_term: @searchterm.search_term, user_id: @searchterm.user_id } }
    end

    assert_redirected_to searchterm_url(Searchterm.last)
  end

  test "should show searchterm" do
    get searchterm_url(@searchterm)
    assert_response :success
  end

  test "should get edit" do
    get edit_searchterm_url(@searchterm)
    assert_response :success
  end

  test "should update searchterm" do
    patch searchterm_url(@searchterm), params: { searchterm: { search_term: @searchterm.search_term, user_id: @searchterm.user_id } }
    assert_redirected_to searchterm_url(@searchterm)
  end

  test "should destroy searchterm" do
    assert_difference('Searchterm.count', -1) do
      delete searchterm_url(@searchterm)
    end

    assert_redirected_to searchterms_url
  end
end
