require 'test_helper'

class KuizuwsControllerTest < ActionController::TestCase
  setup do
    @kuizuw = kuizuws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kuizuws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kuizuw" do
    assert_difference('Kuizuw.count') do
      post :create, kuizuw: { anumber: @kuizuw.anumber }
    end

    assert_redirected_to kuizuw_path(assigns(:kuizuw))
  end

  test "should show kuizuw" do
    get :show, id: @kuizuw
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kuizuw
    assert_response :success
  end

  test "should update kuizuw" do
    patch :update, id: @kuizuw, kuizuw: { anumber: @kuizuw.anumber }
    assert_redirected_to kuizuw_path(assigns(:kuizuw))
  end

  test "should destroy kuizuw" do
    assert_difference('Kuizuw.count', -1) do
      delete :destroy, id: @kuizuw
    end

    assert_redirected_to kuizuws_path
  end
end
