require "sass"

module Smurfville
  class TypographyParser
    attr_accessor :typographies, :typography_sass_file

    def initialize(typography_sass_file = Smurfville.typography_sass_file)
      @typographies = []
      @typography_sass_file = typography_sass_file
    end

    def parse(options = {})
      sass_tree = Sass::Engine.for_file(self.typography_sass_file, options).to_tree
      sass_tree.children.each do | node |
        if is_typography_selector?(node)
          self.typographies << node.rule[0]
        end
      end
    end

    private

      # determines if node is a placeholder selector starting widht the %f- convention for typography rulesets
      def is_typography_selector?(node)
        node.is_a?(Sass::Tree::RuleNode) && node.rule[0].start_with?("%f-") rescue false
      end
  end
end