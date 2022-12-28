require "application_system_test_case"

class BushosTest < ApplicationSystemTestCase
  setup do
    @busho = bushos(:one)
  end

  test "visiting the index" do
    visit bushos_url
    assert_selector "h1", text: "Bushos"
  end

  test "should create busho" do
    visit bushos_url
    click_on "New busho"

    fill_in "Busho name", with: @busho.busho_name
    click_on "Create Busho"

    assert_text "Busho was successfully created"
    click_on "Back"
  end

  test "should update Busho" do
    visit busho_url(@busho)
    click_on "Edit this busho", match: :first

    fill_in "Busho name", with: @busho.busho_name
    click_on "Update Busho"

    assert_text "Busho was successfully updated"
    click_on "Back"
  end

  test "should destroy Busho" do
    visit busho_url(@busho)
    click_on "Destroy this busho", match: :first

    assert_text "Busho was successfully destroyed"
  end
end
