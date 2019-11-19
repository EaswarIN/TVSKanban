require "application_system_test_case"

class TrnProdPlanHeadersTest < ApplicationSystemTestCase
  setup do
    @trn_prod_plan_header = trn_prod_plan_headers(:one)
  end

  test "visiting the index" do
    visit trn_prod_plan_headers_url
    assert_selector "h1", text: "Trn Prod Plan Headers"
  end

  test "creating a Trn prod plan header" do
    visit trn_prod_plan_headers_url
    click_on "New Trn Prod Plan Header"

    click_on "Create Trn prod plan header"

    assert_text "Trn prod plan header was successfully created"
    click_on "Back"
  end

  test "updating a Trn prod plan header" do
    visit trn_prod_plan_headers_url
    click_on "Edit", match: :first

    click_on "Update Trn prod plan header"

    assert_text "Trn prod plan header was successfully updated"
    click_on "Back"
  end

  test "destroying a Trn prod plan header" do
    visit trn_prod_plan_headers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trn prod plan header was successfully destroyed"
  end
end
