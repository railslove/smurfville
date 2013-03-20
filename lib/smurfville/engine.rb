module Smurfville
  class Engine < ::Rails::Engine
    isolate_namespace Smurfville

    initializer "smurfville.sass_directory" do |app|
      Smurfville.sass_directory = Rails.root.join('app', 'assets', 'stylesheets').to_s
    end
  end
end
