require 'test_helper'

class AttendeesControllerTest < ActionController::TestCase
  setup do
    @attendee = attendees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendee" do
    assert_difference('Attendee.count') do
      post :create, attendee: { bring_drinks: @attendee.bring_drinks, bring_food: @attendee.bring_food, bring_theparty: @attendee.bring_theparty, bring_vinyl: @attendee.bring_vinyl, comments: @attendee.comments, confirm_status: @attendee.confirm_status, event_id: @attendee.event_id, user_id: @attendee.user_id }
    end

    assert_redirected_to attendee_path(assigns(:attendee))
  end

  test "should show attendee" do
    get :show, id: @attendee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendee
    assert_response :success
  end

  test "should update attendee" do
    patch :update, id: @attendee, attendee: { bring_drinks: @attendee.bring_drinks, bring_food: @attendee.bring_food, bring_theparty: @attendee.bring_theparty, bring_vinyl: @attendee.bring_vinyl, comments: @attendee.comments, confirm_status: @attendee.confirm_status, event_id: @attendee.event_id, user_id: @attendee.user_id }
    assert_redirected_to attendee_path(assigns(:attendee))
  end

  test "should destroy attendee" do
    assert_difference('Attendee.count', -1) do
      delete :destroy, id: @attendee
    end

    assert_redirected_to attendees_path
  end
end
