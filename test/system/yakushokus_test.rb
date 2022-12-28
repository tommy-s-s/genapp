require "application_system_test_case"

class YakushokusTest < ApplicationSystemTestCase
  setup do
    @yakushoku = yakushokus(:one)
  end

  test "visiting the index" do
    visit yakushokus_url
    assert_selector "h1", text: "Yakushokus"
  end

  test "should create yakushoku" do
    visit yakushokus_url
    click_on "New yakushoku"

    fill_in "Yaku name", with: @yakushoku.yaku_name
    click_on "Create Yakushoku"

    assert_text "Yakushoku was successfully created"
    click_on "Back"
  end

  test "should update Yakushoku" do
    visit yakushoku_url(@yakushoku)
    click_on "Edit this yakushoku", match: :first

    fill_in "Yaku name", with: @yakushoku.yaku_name
    click_on "Update Yakushoku"

    assert_text "Yakushoku was successfully updated"
    click_on "Back"
  end

  test "should destroy Yakushoku" do
    visit yakushoku_url(@yakushoku)
    click_on "Destroy this yakushoku", match: :first

    assert_text "Yakushoku was successfully destroyed"
  end
end
