require "test_helper"

class HeadOfDepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get head_of_departments_index_url
    assert_response :success
  end

  test "should get show" do
    get head_of_departments_show_url
    assert_response :success
  end

  test "should get new" do
    get head_of_departments_new_url
    assert_response :success
  end

  test "should get create" do
    get head_of_departments_create_url
    assert_response :success
  end

  test "should get edit" do
    get head_of_departments_edit_url
    assert_response :success
  end

  test "should get update" do
    get head_of_departments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get head_of_departments_destroy_url
    assert_response :success
  end
end
