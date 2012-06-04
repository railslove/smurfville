require "color/css"
require "sass"

module Smurf
  class ColorVariableParser
    attr_accessor :colors, :variable_mappings, :variable_usage, :sass_directory

    def initialize(sass_directory = Smurf.sass_directory)
      @colors            = {}
      @variable_mappings = {}
      @variable_usage    = {}
      @sass_directory    = sass_directory
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
      Sass::Engine.for_file(file, options).to_tree.children.each do | node |
        if node.kind_of? Sass::Tree::VariableNode
          variable_node_parts = node.to_scss.split(":")
          variable_name       = variable_node_parts[0]
          value               = variable_node_parts[1].gsub(";", "").strip

          if color = Smurf::ColorVariableParser.parse_color(value)
            (self.colors[color.html] ||= []) << variable_name

          elsif value.start_with? "$"
            (self.variable_mappings[value] ||= []) << variable_name

          end
        end
      end
    end

    def parse_variable_usage(file)
      grep_output = `grep -iG "\$" #{file}`
      grep_output.each_line do |line|
        matches = line.scan(/\$[\w-]*/)
        matches.each do |match|
          self.variable_usage[match] ||= 0
          self.variable_usage[match] += 1
        end
      end
    end

    def print_variable_usage_count_for(color)
      self.variable_usage[color] - 1  rescue 0
    end

    def self.parse_color(color)
      return false  unless color.is_a? String
      
      if color.include? "#"
        Color::RGB.from_html(color) rescue false
      elsif Color::CSS[color]
        Color::CSS[color]
      else
        false
      end
    end
  end
end