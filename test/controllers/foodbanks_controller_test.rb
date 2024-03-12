require "test_helper"

class FoodbanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get foodbanks_index_url
    assert_response :success
  end

  test "should get show" do
    get foodbanks_show_url
    assert_response :success
  end

  test "should get new" do
    get foodbanks_new_url
    assert_response :success
  end

  test "should get create" do
    get foodbanks_create_url
    assert_response :success
  end

  test "should get edit" do
    get foodbanks_edit_url
    assert_response :success
  end

  test "should get update" do
    get foodbanks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get foodbanks_destroy_url
    assert_response :success
  end
end
