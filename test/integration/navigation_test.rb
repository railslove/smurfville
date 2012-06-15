require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest

  test "root path" do
    get "/smurfville"

    assert_response :success
    assert_tag :ul, attributes: { class: "smurfville-color-list" }
  end

  test "colors" do
    get "/smurfville"

    assert_response :success
    assert_tag :ul, attributes: { class: "smurfville-color-list" }
  end
end