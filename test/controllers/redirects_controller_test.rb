require 'test_helper'

class RedirectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get redirects_index_url
    assert_response :success
  end

  test "should get create" do
    get redirects_create_url
    assert_response :success
  end

  test "should get new" do
    get redirects_new_url
    assert_response :success
  end

  test "should get edit" do
    get redirects_edit_url
    assert_response :success
  end

  test "should get show" do
    get redirects_show_url
    assert_response :success
  end

  test "should get update" do
    get redirects_update_url
    assert_response :success
  end

  test "should get destroy" do
    get redirects_destroy_url
    assert_response :success
  end

end
