require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #test "should create player" do
  #  #removed for now, because there is no reason to test the post here, cause the projection creates it
  #  #maybe we could test something else here instead
  #end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  #test "should update player" do
  #  #removed for now, because there is no reason to test the update here, cause the projection updates it
  #  #maybe we could test something else here instead
  #end

  #test "should destroy player" do
  #  #removed for now, because there is no reason to test the destroy here, cause the projection destroys it
  #  #maybe we could test something else here instead
  #end
end
