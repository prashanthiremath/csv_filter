require 'test_helper'

class FurnituresControllerTest < ActionController::TestCase
  setup do
    @furniture = furnitures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:furnitures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create furniture" do
    assert_difference('Furniture.count') do
      post :create, furniture: {  }
    end

    assert_redirected_to furniture_path(assigns(:furniture))
  end

  test "should show furniture" do
    get :show, id: @furniture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @furniture
    assert_response :success
  end

  test "should update furniture" do
    put :update, id: @furniture, furniture: {  }
    assert_redirected_to furniture_path(assigns(:furniture))
  end

  test "should destroy furniture" do
    assert_difference('Furniture.count', -1) do
      delete :destroy, id: @furniture
    end

    assert_redirected_to furnitures_path
  end
end
