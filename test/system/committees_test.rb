require "application_system_test_case"

class CommitteesTest < ApplicationSystemTestCase
  setup do
    @committee = committees(:one)
  end

  test "visiting the index" do
    visit committees_url
    assert_selector "h1", text: "Committees"
  end

  test "should create committee" do
    visit committees_url
    click_on "New committee"

    fill_in "Com name", with: @committee.com_name
    click_on "Create Committee"

    assert_text "Committee was successfully created"
    click_on "Back"
  end

  test "should update Committee" do
    visit committee_url(@committee)
    click_on "Edit this committee", match: :first

    fill_in "Com name", with: @committee.com_name
    click_on "Update Committee"

    assert_text "Committee was successfully updated"
    click_on "Back"
  end

  test "should destroy Committee" do
    visit committee_url(@committee)
    click_on "Destroy this committee", match: :first

    assert_text "Committee was successfully destroyed"
  end
end
