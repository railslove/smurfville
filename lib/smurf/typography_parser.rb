require "sass"

module Smurf
  class TypographyParser
    attr_accessor :typographies, :typography_sass_file

    def initialize(typography_sass_file = Smurf.typography_sass_file)
      @typographies = {}
      @typography_sass_file = typography_sass_file
    end

    def parse(options = {})
      sass_tree = Sass::Engine.for_file(self.typography_sass_file, options).to_tree
      sass_tree.children.each do | node |
        if node.kind_of?(Sass::Tree::CommentNode) && is_typography_comment?(node)
          parsed_comment = YAML.load node.value.join.gsub!("// ", "")
          self.typographies[parsed_comment["styleguide_typography"]["mixin"]] = parsed_comment["styleguide_typography"]["params"]
        end
      end
    end

    private

      def is_typography_comment?(comment_node)
        comment_node.value.any? { |comment| comment.index("styleguide_typography") }
      end
  end
end