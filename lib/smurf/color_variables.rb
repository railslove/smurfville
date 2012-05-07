require "color/css"
require "sass"

module Smurf
  mattr_accessor :sass_directory

  class ColorVariables

    def self.parse_sass_directory(directory = Smurf.sass_directory)
      complete_hash = {colors: {}, variable_mappings: {}}

      Dir.glob("#{directory}/**/*").each do |file|
        if file.end_with?(".sass", ".scss") && file_hash = parse_sass_file(file)
          [:colors, :variable_mappings].each do |key|
            # merges hashes, with doing an array union where applicable
            complete_hash[key].merge!(file_hash[key]) { |key, v1, v2|
              v1.kind_of?(Array) && v2.kind_of?(Array) ? v1 | v2 : v2
            }
          end
        end
      end
      
      unless complete_hash[:colors].empty? && complete_hash[:colors].empty?
        complete_hash
      else
        false
      end
    end

    # parses Sass file and returns hash with colors and variable_mappings (or false)
    def self.parse_sass_file(file, options = {})
      colors = {}
      variable_mappings = {}

      Sass::Engine.for_file(file, options).to_tree.children.each do | node |
        if node.kind_of? Sass::Tree::VariableNode
          parts = node.to_scss.split(":")
          variable_name = parts[0]
          value = parts[1].gsub(";", "").strip

          if color = parse_color(value)
            (colors[color.html] ||= []) << variable_name

          elsif value.start_with? "$"
            (variable_mappings[value] ||= []) << variable_name

          end
        end
      end
      
      unless colors.empty? && variable_mappings.empty?
        {colors: colors, variable_mappings: variable_mappings}
      else
        false
      end 
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

    # returns readable foreground color ("black" or "white") based on passed in color
    def self.foreground_color(color)
      if color = parse_color(color)
        return "black"  if color.brightness > 0.5
      end
      return "white"
    end
  end
end