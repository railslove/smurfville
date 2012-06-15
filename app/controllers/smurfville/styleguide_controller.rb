module Smurfville
  class StyleguideController < ApplicationController
    layout "smurfville/application"

    def colors
      @parser = Smurfville::ColorVariableParser.new
      @parser.parse
    end

    def partials
    end

    def helper
    end

    def typography
      # @parser = Smurfville::TypographyParser.new
      # @parser.parse
    end
  end
end
