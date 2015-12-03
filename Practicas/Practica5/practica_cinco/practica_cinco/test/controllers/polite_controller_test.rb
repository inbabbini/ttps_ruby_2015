require 'test_helper'

class PoliteControllerTest < ActionController::TestCase
  test "should get salute" do
    get :salute
    assert_response :success
  end

end
