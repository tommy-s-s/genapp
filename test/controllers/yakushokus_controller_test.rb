require "test_helper"

class YakushokusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yakushoku = yakushokus(:one)
  end

  test "should get index" do
    get yakushokus_url
    assert_response :success
  end

  test "should get new" do
    get new_yakushoku_url
    assert_response :success
  end

  test "should create yakushoku" do
    assert_difference("Yakushoku.count") do
      post yakushokus_url, params: { yakushoku: { yaku_name: @yakushoku.yaku_name } }
    end

    assert_redirected_to yakushoku_url(Yakushoku.last)
  end

  test "should show yakushoku" do
    get yakushoku_url(@yakushoku)
    assert_response :success
  end

  test "should get edit" do
    get edit_yakushoku_url(@yakushoku)
    assert_response :success
  end

  test "should update yakushoku" do
    patch yakushoku_url(@yakushoku), params: { yakushoku: { yaku_name: @yakushoku.yaku_name } }
    assert_redirected_to yakushoku_url(@yakushoku)
  end

  test "should destroy yakushoku" do
    assert_difference("Yakushoku.count", -1) do
      delete yakushoku_url(@yakushoku)
    end

    assert_redirected_to yakushokus_url
  end
end
