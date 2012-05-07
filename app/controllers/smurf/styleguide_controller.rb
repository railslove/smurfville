module Smurf
  class StyleguideController < ApplicationController
    def colors
      @color_vars = Smurf::ColorVariables.parse_sass_directory
    end

    def partials
    end

    def helper
    end
  end
end
