require "test_helper"

class CollegesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colleges_index_url
    assert_response :success
  end

  test "should get new" do
    get colleges_new_url
    assert_response :success
  end

  test "should get create" do
    get colleges_create_url
    assert_response :success
  end

  test "should get edit" do
    get colleges_edit_url
    assert_response :success
  end

  test "should get update" do
    get colleges_update_url
    assert_response :success
  end

  test "should get destroy" do
    get colleges_destroy_url
    assert_response :success
  end
end
