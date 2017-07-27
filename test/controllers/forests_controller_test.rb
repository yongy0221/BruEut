require 'test_helper'

class ForestsControllerTest < ActionController::TestCase
  setup do
    @forest = forests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forest" do
    assert_difference('Forest.count') do
      post :create, forest: { content: @forest.content }
    end

    assert_redirected_to forest_path(assigns(:forest))
  end

  test "should show forest" do
    get :show, id: @forest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forest
    assert_response :success
  end

  test "should update forest" do
    patch :update, id: @forest, forest: { content: @forest.content }
    assert_redirected_to forest_path(assigns(:forest))
  end

  test "should destroy forest" do
    assert_difference('Forest.count', -1) do
      delete :destroy, id: @forest
    end

    assert_redirected_to forests_path
  end
end
