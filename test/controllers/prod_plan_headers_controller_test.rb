require 'test_helper'

class ProdPlanHeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prod_plan_header = prod_plan_headers(:one)
  end

  test "should get index" do
    get prod_plan_headers_url
    assert_response :success
  end

  test "should get new" do
    get new_prod_plan_header_url
    assert_response :success
  end

  test "should create prod_plan_header" do
    assert_difference('ProdPlanHeader.count') do
      post prod_plan_headers_url, params: { prod_plan_header: {  } }
    end

    assert_redirected_to prod_plan_header_url(ProdPlanHeader.last)
  end

  test "should show prod_plan_header" do
    get prod_plan_header_url(@prod_plan_header)
    assert_response :success
  end

  test "should get edit" do
    get edit_prod_plan_header_url(@prod_plan_header)
    assert_response :success
  end

  test "should update prod_plan_header" do
    patch prod_plan_header_url(@prod_plan_header), params: { prod_plan_header: {  } }
    assert_redirected_to prod_plan_header_url(@prod_plan_header)
  end

  test "should destroy prod_plan_header" do
    assert_difference('ProdPlanHeader.count', -1) do
      delete prod_plan_header_url(@prod_plan_header)
    end

    assert_redirected_to prod_plan_headers_url
  end
end
