require "test_helper"

class EvaluationCriteriumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evaluation_criteriums_index_url
    assert_response :success
  end

  test "should get new" do
    get evaluation_criteriums_new_url
    assert_response :success
  end

  test "should get show" do
    get evaluation_criteriums_show_url
    assert_response :success
  end

  test "should get create" do
    get evaluation_criteriums_create_url
    assert_response :success
  end

  test "should get edit" do
    get evaluation_criteriums_edit_url
    assert_response :success
  end

  test "should get update" do
    get evaluation_criteriums_update_url
    assert_response :success
  end

  test "should get destroy" do
    get evaluation_criteriums_destroy_url
    assert_response :success
  end
end
