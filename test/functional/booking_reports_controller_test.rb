require 'test_helper'

class BookingReportsControllerTest < ActionController::TestCase
  setup do
    @booking_report = booking_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_report" do
    assert_difference('BookingReport.count') do
      post :create, booking_report: { description: @booking_report.description, name: @booking_report.name }
    end

    assert_redirected_to booking_report_path(assigns(:booking_report))
  end

  test "should show booking_report" do
    get :show, id: @booking_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_report
    assert_response :success
  end

  test "should update booking_report" do
    put :update, id: @booking_report, booking_report: { description: @booking_report.description, name: @booking_report.name }
    assert_redirected_to booking_report_path(assigns(:booking_report))
  end

  test "should destroy booking_report" do
    assert_difference('BookingReport.count', -1) do
      delete :destroy, id: @booking_report
    end

    assert_redirected_to booking_reports_path
  end
end
