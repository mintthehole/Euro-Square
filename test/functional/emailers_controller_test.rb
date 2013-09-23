require 'test_helper'

class EmailersControllerTest < ActionController::TestCase
  setup do
    @emailer = emailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emailer" do
    assert_difference('Emailer.count') do
      post :create, emailer: { bcc: @emailer.bcc, body: @emailer.body, cc: @emailer.cc, footer: @emailer.footer, header: @emailer.header, name: @emailer.name, stage: @emailer.stage, subject: @emailer.subject }
    end

    assert_redirected_to emailer_path(assigns(:emailer))
  end

  test "should show emailer" do
    get :show, id: @emailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emailer
    assert_response :success
  end

  test "should update emailer" do
    put :update, id: @emailer, emailer: { bcc: @emailer.bcc, body: @emailer.body, cc: @emailer.cc, footer: @emailer.footer, header: @emailer.header, name: @emailer.name, stage: @emailer.stage, subject: @emailer.subject }
    assert_redirected_to emailer_path(assigns(:emailer))
  end

  test "should destroy emailer" do
    assert_difference('Emailer.count', -1) do
      delete :destroy, id: @emailer
    end

    assert_redirected_to emailers_path
  end
end
