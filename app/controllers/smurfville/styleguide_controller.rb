module Smurfville
  class StyleguideController < ApplicationController
    layout "smurfville"

    def colors
      @parser = Smurfville::ColorVariableParser.new
      @parser.parse
    end

    def typography
      @parser = Smurfville::TypographyParser.new
      @parser.parse
    end

    def modules
      @smurfville = true
      @modules = ["events/m_tooltip", "modules/categories/indicator"]
    end
  end
end
