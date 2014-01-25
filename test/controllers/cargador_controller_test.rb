require 'test_helper'

class CargadorControllerTest < ActionController::TestCase
  test "should get subirPerroEncontrado" do
    get :subirPerroEncontrado
    assert_response :success
  end

end
