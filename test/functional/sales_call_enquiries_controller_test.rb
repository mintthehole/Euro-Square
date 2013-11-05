require 'test_helper'

class SalesCallEnquiriesControllerTest < ActionController::TestCase
  setup do
    @sales_call_enquiry = sales_call_enquiries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_call_enquiries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_call_enquiry" do
    assert_difference('SalesCallEnquiry.count') do
      post :create, sales_call_enquiry: { cargo: @sales_call_enquiry.cargo, competitor: @sales_call_enquiry.competitor, mode: @sales_call_enquiry.mode, pod: @sales_call_enquiry.pod, pol: @sales_call_enquiry.pol, possibility_to_secure: @sales_call_enquiry.possibility_to_secure, rate_indication: @sales_call_enquiry.rate_indication, shipment_date: @sales_call_enquiry.shipment_date, special_instruction: @sales_call_enquiry.special_instruction, volume_idea: @sales_call_enquiry.volume_idea }
    end

    assert_redirected_to sales_call_enquiry_path(assigns(:sales_call_enquiry))
  end

  test "should show sales_call_enquiry" do
    get :show, id: @sales_call_enquiry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_call_enquiry
    assert_response :success
  end

  test "should update sales_call_enquiry" do
    put :update, id: @sales_call_enquiry, sales_call_enquiry: { cargo: @sales_call_enquiry.cargo, competitor: @sales_call_enquiry.competitor, mode: @sales_call_enquiry.mode, pod: @sales_call_enquiry.pod, pol: @sales_call_enquiry.pol, possibility_to_secure: @sales_call_enquiry.possibility_to_secure, rate_indication: @sales_call_enquiry.rate_indication, shipment_date: @sales_call_enquiry.shipment_date, special_instruction: @sales_call_enquiry.special_instruction, volume_idea: @sales_call_enquiry.volume_idea }
    assert_redirected_to sales_call_enquiry_path(assigns(:sales_call_enquiry))
  end

  test "should destroy sales_call_enquiry" do
    assert_difference('SalesCallEnquiry.count', -1) do
      delete :destroy, id: @sales_call_enquiry
    end

    assert_redirected_to sales_call_enquiries_path
  end
end
