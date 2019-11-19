require 'test_helper'

class TrnProdPlanHeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trn_prod_plan_header = trn_prod_plan_headers(:one)
  end

  test "should get index" do
    get trn_prod_plan_headers_url
    assert_response :success
  end

  test "should get new" do
    get new_trn_prod_plan_header_url
    assert_response :success
  end

  test "should create trn_prod_plan_header" do
    assert_difference('TrnProdPlanHeader.count') do
      post trn_prod_plan_headers_url, params: { trn_prod_plan_header: {  } }
    end

    assert_redirected_to trn_prod_plan_header_url(TrnProdPlanHeader.last)
  end

  test "should show trn_prod_plan_header" do
    get trn_prod_plan_header_url(@trn_prod_plan_header)
    assert_response :success
  end

  test "should get edit" do
    get edit_trn_prod_plan_header_url(@trn_prod_plan_header)
    assert_response :success
  end

  test "should update trn_prod_plan_header" do
    patch trn_prod_plan_header_url(@trn_prod_plan_header), params: { trn_prod_plan_header: {  } }
    assert_redirected_to trn_prod_plan_header_url(@trn_prod_plan_header)
  end

  test "should destroy trn_prod_plan_header" do
    assert_difference('TrnProdPlanHeader.count', -1) do
      delete trn_prod_plan_header_url(@trn_prod_plan_header)
    end

    assert_redirected_to trn_prod_plan_headers_url
  end
end
