require 'test_helper'

class SalesCallEntriesControllerTest < ActionController::TestCase
  setup do
    @sales_call_entry = sales_call_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_call_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_call_entry" do
    assert_difference('SalesCallEntry.count') do
      post :create, sales_call_entry: { date: @sales_call_entry.date, enquiry_recieved: @sales_call_entry.enquiry_recieved, escalation: @sales_call_entry.escalation, my_observation: @sales_call_entry.my_observation, pic: @sales_call_entry.pic, point_discussed: @sales_call_entry.point_discussed, shipper_name: @sales_call_entry.shipper_name }
    end

    assert_redirected_to sales_call_entry_path(assigns(:sales_call_entry))
  end

  test "should show sales_call_entry" do
    get :show, id: @sales_call_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_call_entry
    assert_response :success
  end

  test "should update sales_call_entry" do
    put :update, id: @sales_call_entry, sales_call_entry: { date: @sales_call_entry.date, enquiry_recieved: @sales_call_entry.enquiry_recieved, escalation: @sales_call_entry.escalation, my_observation: @sales_call_entry.my_observation, pic: @sales_call_entry.pic, point_discussed: @sales_call_entry.point_discussed, shipper_name: @sales_call_entry.shipper_name }
    assert_redirected_to sales_call_entry_path(assigns(:sales_call_entry))
  end

  test "should destroy sales_call_entry" do
    assert_difference('SalesCallEntry.count', -1) do
      delete :destroy, id: @sales_call_entry
    end

    assert_redirected_to sales_call_entries_path
  end
end
