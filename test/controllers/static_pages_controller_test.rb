require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_response :success
  end

  test "should get help" do
    get helf_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end
end
