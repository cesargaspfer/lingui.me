require 'test_helper'

class TeachControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teach_index_url
    assert_response :success
  end

end
