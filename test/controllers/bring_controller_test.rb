require 'test_helper'

class BringControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bring_index_url
    assert_response :success
  end

end
