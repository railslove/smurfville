# require "color/css"
require "sass"

module Smurfville
  class ColorVariableParser
    attr_accessor :colors, :variable_mappings, :variable_usage, :sass_directory, :sass_env

    def initialize(sass_directory = Smurfville.sass_directory)
      @colors            = {}
      @variable_mappings = {} # e.g. { '$white' => { '$light-color', '$light-background-color' }, $black => {...} }
      @variable_usage    = {} # e.g. { 'white' => { :variables => ['light-color', 'text-color'] } :alternate_values => ['#fff', '#ffffff']}
      @sass_directory    = sass_directory
      @sass_env          = Sass::Environment.new
    end

    def parse_sass_directory(directory = sass_directory)
      Dir.glob("#{directory}/**/*").each do |file|
        if file.end_with?(".sass", ".scss")
          parse_sass_file(file)
          parse_variable_usage(file)
        end
      end
    end
    alias_method :parse, :parse_sass_directory

    # parses Sass file and returns hash with colors and variable_mappings (or false)
    def parse_sass_file(file, options = {})
      Sass::Engine.for_file(file, options).to_tree.children.each do |node|
        if node.kind_of? Sass::Tree::VariableNode
          if node.expr.is_a? Sass::Script::Color
            add_color(node)

          elsif node.expr.is_a? Sass::Script::Funcall # if function call (e.g. lighten(#000, 20%)), try to resolve to color
            resolved = node.expr.perform(sass_env) rescue false

            if resolved.is_a? Sass::Script::Color
              add_color(node, resolved.to_s)
            end

          elsif node.expr.is_a? Sass::Script::Variable
            (self.variable_mappings[node.expr.name] ||= []) << node.name # add to variable mapping
          end

        end
      end
    end

    # add found color to @colors
    def add_color(node, key = nil)
      key ||= node.expr.to_s

      self.colors[key] ||= { :variables => [], :alternate_values => [] }
      self.colors[key][:variables] << node.name

      self.colors[key][:alternate_values] |= ([node.expr.to_sass, node.expr.inspect] - [key])
    end

    # count the usages of all the Sass variables
    def parse_variable_usage(file)
      grep_output = `grep -iG "\\$" #{file}`
      grep_output.each_line do |line|
        matches = line.scan(/\$[\w-]*/)
        matches.each do |match|
          match.gsub!('$', '')
          self.variable_usage[match] ||= 0
          self.variable_usage[match] += 1
        end
      end
    end

    def print_variable_usage_count_for(color)
      self.variable_usage[color] - 1  rescue 0
    end
  end
end