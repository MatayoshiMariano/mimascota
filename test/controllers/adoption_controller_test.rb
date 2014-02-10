require 'test_helper'

class AdoptionControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
