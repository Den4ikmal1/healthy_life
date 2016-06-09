require 'test_helper'

class ProcessTrainingsControllerTest < ActionController::TestCase
  setup do
    @process_training = process_trainings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:process_trainings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create process_training" do
    assert_difference('ProcessTraining.count') do
      post :create, process_training: {  }
    end

    assert_redirected_to process_training_path(assigns(:process_training))
  end

  test "should show process_training" do
    get :show, id: @process_training
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @process_training
    assert_response :success
  end

  test "should update process_training" do
    patch :update, id: @process_training, process_training: {  }
    assert_redirected_to process_training_path(assigns(:process_training))
  end

  test "should destroy process_training" do
    assert_difference('ProcessTraining.count', -1) do
      delete :destroy, id: @process_training
    end

    assert_redirected_to process_trainings_path
  end
end
