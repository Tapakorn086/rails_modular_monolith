module Blorgh
  class Engine < ::Rails::Engine
    isolate_namespace Blorgh

    initialize "blorgh.assets" do |app|
      app.config.assets.path << root.join("app/javascript")
    end
  end
end
