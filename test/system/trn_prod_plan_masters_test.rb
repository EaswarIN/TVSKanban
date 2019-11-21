require "application_system_test_case"

class TrnProdPlanMastersTest < ApplicationSystemTestCase
  setup do
    @trn_prod_plan_master = trn_prod_plan_masters(:one)
  end

  test "visiting the index" do
    visit trn_prod_plan_masters_url
    assert_selector "h1", text: "Trn Prod Plan Masters"
  end

  test "creating a Trn prod plan master" do
    visit trn_prod_plan_masters_url
    click_on "New Trn Prod Plan Master"

    click_on "Create Trn prod plan master"

    assert_text "Trn prod plan master was successfully created"
    click_on "Back"
  end

  test "updating a Trn prod plan master" do
    visit trn_prod_plan_masters_url
    click_on "Edit", match: :first

    click_on "Update Trn prod plan master"

    assert_text "Trn prod plan master was successfully updated"
    click_on "Back"
  end

  test "destroying a Trn prod plan master" do
    visit trn_prod_plan_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trn prod plan master was successfully destroyed"
  end
end
