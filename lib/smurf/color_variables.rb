require "color/css"

module Smurf
  class ColorVariables
    mattr_accessor :sass_directory

    def self.parse_directory(directory = @@sass_directory)
      complete_hash = {colors: {}, variable_mappings: {}}

      Dir.glob("#{directory}/**/*").each do |file|
        if file.end_with?(".sass", ".scss") && file_hash = parse_file(file)
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
    def self.parse_file(file, options = {})
      colors = {}
      variable_mappings = {}

      Sass::Engine.for_file(file, options).to_tree.children.each do | node |
        if node.kind_of? Sass::Tree::VariableNode
          parts = node.to_scss.split(":")
          variable_name = parts[0]
          value = parts[1].gsub(";", "").strip

          if color = is_color?(value)
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

    def self.is_color?(color)
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