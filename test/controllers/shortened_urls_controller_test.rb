require "test_helper"

class ShortenedUrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shortened_urls_index_url
    assert_response :success
  end

  test "should get show" do
    get shortened_urls_show_url
    assert_response :success
  end

  test "should get create" do
    get shortened_urls_create_url
    assert_response :success
  end

  test "should get destroy" do
    get shortened_urls_destroy_url
    assert_response :success
  end

  test "should get update" do
    get shortened_urls_update_url
    assert_response :success
  end
end
