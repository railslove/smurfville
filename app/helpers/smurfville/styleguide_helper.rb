require "color/css"

module Smurfville
  module StyleguideHelper

    # returns well readable, high-contrast foreground color ("black" or "white") based on passed background_color
    def foreground_color(background_color)
      if color = Smurfville::ColorVariableParser.parse_color(background_color)
        color.brightness > 0.5 ? "black" : "white"
      else
        "black"
      end
    end
  end
end
