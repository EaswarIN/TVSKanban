require "application_system_test_case"

class ProdPlanHeadersTest < ApplicationSystemTestCase
  setup do
    @prod_plan_header = prod_plan_headers(:one)
  end

  test "visiting the index" do
    visit prod_plan_headers_url
    assert_selector "h1", text: "Prod Plan Headers"
  end

  test "creating a Prod plan header" do
    visit prod_plan_headers_url
    click_on "New Prod Plan Header"

    click_on "Create Prod plan header"

    assert_text "Prod plan header was successfully created"
    click_on "Back"
  end

  test "updating a Prod plan header" do
    visit prod_plan_headers_url
    click_on "Edit", match: :first

    click_on "Update Prod plan header"

    assert_text "Prod plan header was successfully updated"
    click_on "Back"
  end

  test "destroying a Prod plan header" do
    visit prod_plan_headers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prod plan header was successfully destroyed"
  end
end
