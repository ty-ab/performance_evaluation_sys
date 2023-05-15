require "test_helper"

class EvaluationResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evaluation_results_index_url
    assert_response :success
  end

  test "should get new" do
    get evaluation_results_new_url
    assert_response :success
  end

  test "should get show" do
    get evaluation_results_show_url
    assert_response :success
  end

  test "should get create" do
    get evaluation_results_create_url
    assert_response :success
  end

  test "should get edit" do
    get evaluation_results_edit_url
    assert_response :success
  end

  test "should get update" do
    get evaluation_results_update_url
    assert_response :success
  end

  test "should get destroy" do
    get evaluation_results_destroy_url
    assert_response :success
  end
end
