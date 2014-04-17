require 'test_helper'

class BoReportsControllerTest < ActionController::TestCase
  setup do
    @bo_report = bo_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bo_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bo_report" do
    assert_difference('BoReport.count') do
      post :create, bo_report: { name: @bo_report.name }
    end

    assert_redirected_to bo_report_path(assigns(:bo_report))
  end

  test "should show bo_report" do
    get :show, id: @bo_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bo_report
    assert_response :success
  end

  test "should update bo_report" do
    put :update, id: @bo_report, bo_report: { name: @bo_report.name }
    assert_redirected_to bo_report_path(assigns(:bo_report))
  end

  test "should destroy bo_report" do
    assert_difference('BoReport.count', -1) do
      delete :destroy, id: @bo_report
    end

    assert_redirected_to bo_reports_path
  end
end
