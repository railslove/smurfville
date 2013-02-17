require "color/css"

module Smurfville
  module StyleguideHelper

    # returns well readable, high-contrast foreground color ("black" or "white") based on passed background_color
    def foreground_color(background_color)
      if color = (Color::RGB.from_html(background_color) rescue false) || color = Color::CSS[background_color]
        color.brightness > 0.5 ? "black" : "white"
      else
        "black"
      end
    end

    def typography_class(typography)
      typography.gsub("%f-", "")
    end

    def typography_humanized(typography)
      typography.gsub("%f-", "").gsub("-", " ")
    end
  end
end
