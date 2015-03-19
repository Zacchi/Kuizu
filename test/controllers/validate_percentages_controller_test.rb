require 'test_helper'

class ValidatePercentagesControllerTest < ActionController::TestCase
  setup do
    @validate_percentage = validate_percentages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:validate_percentages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create validate_percentage" do
    assert_difference('ValidatePercentage.count') do
      post :create, validate_percentage: {  }
    end

    assert_redirected_to validate_percentage_path(assigns(:validate_percentage))
  end

  test "should show validate_percentage" do
    get :show, id: @validate_percentage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @validate_percentage
    assert_response :success
  end

  test "should update validate_percentage" do
    patch :update, id: @validate_percentage, validate_percentage: {  }
    assert_redirected_to validate_percentage_path(assigns(:validate_percentage))
  end

  test "should destroy validate_percentage" do
    assert_difference('ValidatePercentage.count', -1) do
      delete :destroy, id: @validate_percentage
    end

    assert_redirected_to validate_percentages_path
  end
end
