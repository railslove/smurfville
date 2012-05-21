module Smurf
  class StyleguideController < ApplicationController
    def colors
      @parser = Smurf::ColorVariableParser.new.parse
    end

    def partials
    end

    def helper
    end
  end
end
