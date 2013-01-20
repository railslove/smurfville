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

    def typography_class(typography)
      typography.gsub("%f-", "")
    end

    def typography_humanized(typography)
      typography.gsub("%f-", "").gsub("-", " ")
    end

    # HACK: this ugly hack is here to make helpers of the main_app available,
    # for the partials of the main_app that are rendered within stylgeguide#modules
    # maybe there is a cleaner way to simply include the main app's helpers ???
    def method_missing(method, *args, &block)
      main_app.send(method, *args, &block)
    rescue NoMethodError
      super
    end
  end
end
