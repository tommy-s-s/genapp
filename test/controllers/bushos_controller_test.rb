require "test_helper"

class BushosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @busho = bushos(:one)
  end

  test "should get index" do
    get bushos_url
    assert_response :success
  end

  test "should get new" do
    get new_busho_url
    assert_response :success
  end

  test "should create busho" do
    assert_difference("Busho.count") do
      post bushos_url, params: { busho: { busho_name: @busho.busho_name } }
    end

    assert_redirected_to busho_url(Busho.last)
  end

  test "should show busho" do
    get busho_url(@busho)
    assert_response :success
  end

  test "should get edit" do
    get edit_busho_url(@busho)
    assert_response :success
  end

  test "should update busho" do
    patch busho_url(@busho), params: { busho: { busho_name: @busho.busho_name } }
    assert_redirected_to busho_url(@busho)
  end

  test "should destroy busho" do
    assert_difference("Busho.count", -1) do
      delete busho_url(@busho)
    end

    assert_redirected_to bushos_url
  end
end
