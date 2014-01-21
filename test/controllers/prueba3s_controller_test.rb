require 'test_helper'

class Prueba3sControllerTest < ActionController::TestCase
  setup do
    @prueba3 = prueba3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prueba3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prueba3" do
    assert_difference('Prueba3.count') do
      post :create, prueba3: { nombre: @prueba3.nombre }
    end

    assert_redirected_to prueba3_path(assigns(:prueba3))
  end

  test "should show prueba3" do
    get :show, id: @prueba3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prueba3
    assert_response :success
  end

  test "should update prueba3" do
    patch :update, id: @prueba3, prueba3: { nombre: @prueba3.nombre }
    assert_redirected_to prueba3_path(assigns(:prueba3))
  end

  test "should destroy prueba3" do
    assert_difference('Prueba3.count', -1) do
      delete :destroy, id: @prueba3
    end

    assert_redirected_to prueba3s_path
  end
end
