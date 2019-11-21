require 'test_helper'

class TrnProdPlanMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trn_prod_plan_master = trn_prod_plan_masters(:one)
  end

  test "should get index" do
    get trn_prod_plan_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_trn_prod_plan_master_url
    assert_response :success
  end

  test "should create trn_prod_plan_master" do
    assert_difference('TrnProdPlanMaster.count') do
      post trn_prod_plan_masters_url, params: { trn_prod_plan_master: {  } }
    end

    assert_redirected_to trn_prod_plan_master_url(TrnProdPlanMaster.last)
  end

  test "should show trn_prod_plan_master" do
    get trn_prod_plan_master_url(@trn_prod_plan_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_trn_prod_plan_master_url(@trn_prod_plan_master)
    assert_response :success
  end

  test "should update trn_prod_plan_master" do
    patch trn_prod_plan_master_url(@trn_prod_plan_master), params: { trn_prod_plan_master: {  } }
    assert_redirected_to trn_prod_plan_master_url(@trn_prod_plan_master)
  end

  test "should destroy trn_prod_plan_master" do
    assert_difference('TrnProdPlanMaster.count', -1) do
      delete trn_prod_plan_master_url(@trn_prod_plan_master)
    end

    assert_redirected_to trn_prod_plan_masters_url
  end
end
