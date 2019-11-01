require 'test_helper'

class ProdPlanMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prod_plan_master = prod_plan_masters(:one)
  end

  test "should get index" do
    get prod_plan_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_prod_plan_master_url
    assert_response :success
  end

  test "should create prod_plan_master" do
    assert_difference('ProdPlanMaster.count') do
      post prod_plan_masters_url, params: { prod_plan_master: {  } }
    end

    assert_redirected_to prod_plan_master_url(ProdPlanMaster.last)
  end

  test "should show prod_plan_master" do
    get prod_plan_master_url(@prod_plan_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_prod_plan_master_url(@prod_plan_master)
    assert_response :success
  end

  test "should update prod_plan_master" do
    patch prod_plan_master_url(@prod_plan_master), params: { prod_plan_master: {  } }
    assert_redirected_to prod_plan_master_url(@prod_plan_master)
  end

  test "should destroy prod_plan_master" do
    assert_difference('ProdPlanMaster.count', -1) do
      delete prod_plan_master_url(@prod_plan_master)
    end

    assert_redirected_to prod_plan_masters_url
  end
end
