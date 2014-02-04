module Smurfville
  class Engine < ::Rails::Engine
    isolate_namespace Smurfville

    initializer "smurfville.routes" do |app|
      app.routes.prepend do
        mount Smurfville::Engine => "/smurfville"
      end
    end
  end
end
