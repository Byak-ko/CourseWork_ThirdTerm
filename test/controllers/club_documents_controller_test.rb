require "test_helper"

class ClubDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get club_documents_index_url
    assert_response :success
  end

  test "should get show" do
    get club_documents_show_url
    assert_response :success
  end

  test "should get new" do
    get club_documents_new_url
    assert_response :success
  end

  test "should get create" do
    get club_documents_create_url
    assert_response :success
  end

  test "should get edit" do
    get club_documents_edit_url
    assert_response :success
  end

  test "should get update" do
    get club_documents_update_url
    assert_response :success
  end

  test "should get destroy" do
    get club_documents_destroy_url
    assert_response :success
  end
end
