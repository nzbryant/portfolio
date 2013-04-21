require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get quiz" do
    get :quiz
    assert_response :success
  end

  test "should get category" do
    get :category
    assert_response :success
  end

end
