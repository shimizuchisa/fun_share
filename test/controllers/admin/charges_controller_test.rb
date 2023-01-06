require "test_helper"

class Admin::ChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_charges_index_url
    assert_response :success
  end
end
