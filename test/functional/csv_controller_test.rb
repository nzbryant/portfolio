require 'test_helper'

class CsvControllerTest < ActionController::TestCase
  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
