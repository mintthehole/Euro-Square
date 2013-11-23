require 'test_helper'

class BookingEmailersControllerTest < ActionController::TestCase
  setup do
    @booking_emailer = booking_emailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_emailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_emailer" do
    assert_difference('BookingEmailer.count') do
      post :create, booking_emailer: { state: @booking_emailer.state }
    end

    assert_redirected_to booking_emailer_path(assigns(:booking_emailer))
  end

  test "should show booking_emailer" do
    get :show, id: @booking_emailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_emailer
    assert_response :success
  end

  test "should update booking_emailer" do
    put :update, id: @booking_emailer, booking_emailer: { state: @booking_emailer.state }
    assert_redirected_to booking_emailer_path(assigns(:booking_emailer))
  end

  test "should destroy booking_emailer" do
    assert_difference('BookingEmailer.count', -1) do
      delete :destroy, id: @booking_emailer
    end

    assert_redirected_to booking_emailers_path
  end
end
