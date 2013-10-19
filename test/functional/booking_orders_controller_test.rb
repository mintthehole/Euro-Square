require 'test_helper'

class BookingOrdersControllerTest < ActionController::TestCase
  setup do
    @booking_order = booking_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_order" do
    assert_difference('BookingOrder.count') do
      post :create, booking_order: { business_name: @booking_order.business_name, email: @booking_order.email, phone: @booking_order.phone }
    end

    assert_redirected_to booking_order_path(assigns(:booking_order))
  end

  test "should show booking_order" do
    get :show, id: @booking_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_order
    assert_response :success
  end

  test "should update booking_order" do
    put :update, id: @booking_order, booking_order: { business_name: @booking_order.business_name, email: @booking_order.email, phone: @booking_order.phone }
    assert_redirected_to booking_order_path(assigns(:booking_order))
  end

  test "should destroy booking_order" do
    assert_difference('BookingOrder.count', -1) do
      delete :destroy, id: @booking_order
    end

    assert_redirected_to booking_orders_path
  end
end
