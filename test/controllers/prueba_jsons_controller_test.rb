require 'test_helper'

class PruebaJsonsControllerTest < ActionController::TestCase
  setup do
    @prueba_json = prueba_jsons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prueba_jsons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prueba_json" do
    assert_difference('PruebaJson.count') do
      post :create, prueba_json: {  }
    end

    assert_redirected_to prueba_json_path(assigns(:prueba_json))
  end

  test "should show prueba_json" do
    get :show, id: @prueba_json
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prueba_json
    assert_response :success
  end

  test "should update prueba_json" do
    patch :update, id: @prueba_json, prueba_json: {  }
    assert_redirected_to prueba_json_path(assigns(:prueba_json))
  end

  test "should destroy prueba_json" do
    assert_difference('PruebaJson.count', -1) do
      delete :destroy, id: @prueba_json
    end

    assert_redirected_to prueba_jsons_path
  end
end
