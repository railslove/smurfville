require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class ColorVariablesTest < ActiveSupport::TestCase

  # ---- parse_variable_usage ----

  test "parse_variable_usage" do
    parser = Smurfville::ColorVariableParser.new
    parser.parse_variable_usage "#{File.dirname(__FILE__)}/sass/colors_01.sass"

    variable_counts = [
      ["green",   2],
      ["white",   2],
      ["special", 4],
      ["foo",     nil]
    ]

    variable_counts.each do |count_pair|
      assert_equal count_pair[1], parser.variable_usage[count_pair[0]]
    end
  end

  test "parse_sass_file" do
    parser = Smurfville::ColorVariableParser.new
    parser.parse_sass_file "#{File.dirname(__FILE__)}/sass/colors_01.sass"

    assert_equal({
      "green" => { :variables => ["green"], :alternate_values=>["#008000"] },
      "white" => { :variables => ["white", "another-white"], :alternate_values => ["#ffffff"] },
      "black" => { :variables => ["black"], :alternate_values=>["#000000"] },
    }, parser.colors)

    assert_equal({
      "white" => ["light-color"],
      "black" => ["dark-color"],
      "green" => ["special"],
      "special" => ["more_special"]
    }, parser.variable_mappings)
  end

  test "print_variable_usage_count_for" do
    parser = Smurfville::ColorVariableParser.new
    parser.variable_usage = {"$green" => 1, "$special" => 2}

    assert_equal 0, parser.print_variable_usage_count_for("$green")
    assert_equal 1, parser.print_variable_usage_count_for("$special")
    assert_equal 0, parser.print_variable_usage_count_for("$foo")
  end
end