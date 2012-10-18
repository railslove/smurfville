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
      @typographies = ["%f-gigantic-headline", "%f-big-headline", "%f-default-headline", "%f-small-headline", "%f-big-fliesstext", "%f-default-fliesstext", "%f-small-fliesstext"]
    end
  end
end
