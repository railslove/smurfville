# encoding: UTF-8

require 'test_helper'

module Smurfville
  class StyleguideHelperTest < ActionView::TestCase
    test 'foreground_color' do
      # dark colors
      assert_equal "white", foreground_color("red")
      assert_equal "white", foreground_color("#012123")
      assert_equal "white", foreground_color("#000")

      # bright colors
      assert_equal "black", foreground_color("#efefef")
      assert_equal "black", foreground_color("white")

      # non-colors
      # => black = default
      assert_equal "black", foreground_color("türkis")
      assert_equal "black", foreground_color(nil)
    end
  end
end
