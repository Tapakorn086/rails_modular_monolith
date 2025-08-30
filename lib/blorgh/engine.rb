module Blorgh
  class Engine < ::Rails::Engine
    isolate_namespace Blorgh

    initializer "blorgh.assets" do |app|
      app.config.assets.paths << root.join("app/javascript")
    end
  end
end
