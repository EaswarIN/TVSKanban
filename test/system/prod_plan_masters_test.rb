require "application_system_test_case"

class ProdPlanMastersTest < ApplicationSystemTestCase
  setup do
    @prod_plan_master = prod_plan_masters(:one)
  end

  test "visiting the index" do
    visit prod_plan_masters_url
    assert_selector "h1", text: "Prod Plan Masters"
  end

  test "creating a Prod plan master" do
    visit prod_plan_masters_url
    click_on "New Prod Plan Master"

    click_on "Create Prod plan master"

    assert_text "Prod plan master was successfully created"
    click_on "Back"
  end

  test "updating a Prod plan master" do
    visit prod_plan_masters_url
    click_on "Edit", match: :first

    click_on "Update Prod plan master"

    assert_text "Prod plan master was successfully updated"
    click_on "Back"
  end

  test "destroying a Prod plan master" do
    visit prod_plan_masters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prod plan master was successfully destroyed"
  end
end
