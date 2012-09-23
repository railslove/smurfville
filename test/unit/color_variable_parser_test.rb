require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class ColorVariablesTest < ActiveSupport::TestCase

  # ---- parse_variable_usage ----

  test "parse_variable_usage" do
    parser = Smurfville::ColorVariableParser.new
    parser.parse_variable_usage "#{File.dirname(__FILE__)}/sass/colors_01.sass"

    variable_counts = [
      ["$green",   2],
      ["$white",   2],
      ["$special", 4],
      ["$foo",     nil]
    ]

    variable_counts.each do |count_pair|
      assert_equal count_pair[1], parser.variable_usage[count_pair[0]]
    end
  end

  test "parse_sass_file" do
    parser = Smurfville::ColorVariableParser.new
    parser.parse_sass_file "#{File.dirname(__FILE__)}/sass/colors_01.sass"

    assert_equal({
      "#008000" => ["$green"],
      "#ffffff" => ["$white", "$another-white"],
      "#000000" => ["$black"],
      "shade($special, 10%)" => ["$function-generated"]
    }, parser.colors)

    assert_equal({
      "$white" => ["$light-color"],
      "$black" => ["$dark-color"],
      "$green" => ["$special"],
      "$special" => ["$more_special"]
    }, parser.variable_mappings)
  end

  test "print_variable_usage_count_for" do
    parser = Smurfville::ColorVariableParser.new
    parser.variable_usage = {"$green" => 1, "$special" => 2}

    assert_equal 0, parser.print_variable_usage_count_for("$green")
    assert_equal 1, parser.print_variable_usage_count_for("$special")
    assert_equal 0, parser.print_variable_usage_count_for("$foo")
  end

  # ---- parse_color ----

  test "parse_color with valid colors" do
    equal_colors = [
      ["#000000", "#000"],
      ["#ff0000", "red"],
      ["#000000", "black"],
      ["#ffffff", "white"]
    ]
    equal_colors.each do |color_pair|
      assert_equal color_pair[0], Smurfville::ColorVariableParser.parse_color(color_pair[1]).html
    end
  end

  test "parse_color with invalid colors" do
    invalid_colors = [nil, "", true, "#0001", "gruen", "####", "#12", "#ffffff7", "(1, 2, 3)"]  # didn't work:  "#0xy000"
    invalid_colors.each do |color|
      assert_equal false, Smurfville::ColorVariableParser.parse_color(color)
    end
  end

  test 'is_sass_color_function?' do
    # real sass color functions
    assert  Smurfville::ColorVariableParser.is_sass_color_function?("tint(#ccc, 27%)")
    assert  Smurfville::ColorVariableParser.is_sass_color_function?("shade($other-color, 0%)")
    # other expressions
    assert !Smurfville::ColorVariableParser.is_sass_color_function?("13px + 37px")
  end
end
