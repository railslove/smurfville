require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class ColorVariablesTest < ActiveSupport::TestCase

  test "parse_sass_file" do
    parser = Smurf::ColorVariableParser.new
    parser.parse_sass_file "#{File.dirname(__FILE__)}/sass/test_01.sass"

    assert_equal ["$white", "$another-white"], parser.colors["#ffffff"]
    assert_equal ["$black"], parser.colors["#000000"]
    assert_equal ["$green"], parser.colors["#008000"]

    assert_equal ["$light-color"], parser.variable_mappings["$white"]
    assert_equal ["$dark-color"], parser.variable_mappings["$black"]
    assert_equal ["$special"], parser.variable_mappings["$green"]
  end

  test "parse_color with valid colors" do
    equal_colors = [
      ["#000000", "#000"],
      ["#ff0000", "red"],
      ["#000000", "black"],
      ["#ffffff", "white"]
    ]
    equal_colors.each do |color_pair|
      assert_equal color_pair[0], Smurf::ColorVariableParser.parse_color(color_pair[1]).html
    end
  end

  test "parse_color with invalid colors" do
    invalid_colors = [nil, "", true, "#0001", "gruen", "####", "#12", "#ffffff7", "(1, 2, 3)"]  # didn't work:  "#0xy000"
    invalid_colors.each do |color|
      assert_equal false, Smurf::ColorVariableParser.parse_color(color)
    end
  end
end
