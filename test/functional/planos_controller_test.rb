require 'test_helper'

class PlanosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plano" do
    assert_difference('Plano.count') do
      post :create, :plano => { }
    end

    assert_redirected_to plano_path(assigns(:plano))
  end

  test "should show plano" do
    get :show, :id => planos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => planos(:one).to_param
    assert_response :success
  end

  test "should update plano" do
    put :update, :id => planos(:one).to_param, :plano => { }
    assert_redirected_to plano_path(assigns(:plano))
  end

  test "should destroy plano" do
    assert_difference('Plano.count', -1) do
      delete :destroy, :id => planos(:one).to_param
    end

    assert_redirected_to planos_path
  end
end
