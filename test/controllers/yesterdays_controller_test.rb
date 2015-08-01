require 'test_helper'

class YesterdaysControllerTest < ActionController::TestCase
  test "should get yesterday" do
    get :yesterday
    assert_response :success
  end

end
