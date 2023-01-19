require "test_helper"

class FileStoragesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get file_storages_index_url
    assert_response :success
  end

  test "should get new" do
    get file_storages_new_url
    assert_response :success
  end

  test "should get create" do
    get file_storages_create_url
    assert_response :success
  end

  test "should get destroy" do
    get file_storages_destroy_url
    assert_response :success
  end
end
