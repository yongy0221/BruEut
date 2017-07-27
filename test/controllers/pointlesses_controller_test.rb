require 'test_helper'

class PointlessesControllerTest < ActionController::TestCase
  setup do
    @pointless = pointlesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pointlesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pointless" do
    assert_difference('Pointless.count') do
      post :create, pointless: { content: @pointless.content, title: @pointless.title }
    end

    assert_redirected_to pointless_path(assigns(:pointless))
  end

  test "should show pointless" do
    get :show, id: @pointless
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pointless
    assert_response :success
  end

  test "should update pointless" do
    patch :update, id: @pointless, pointless: { content: @pointless.content, title: @pointless.title }
    assert_redirected_to pointless_path(assigns(:pointless))
  end

  test "should destroy pointless" do
    assert_difference('Pointless.count', -1) do
      delete :destroy, id: @pointless
    end

    assert_redirected_to pointlesses_path
  end
end
