module AstroEngine
  class Engine < ::Rails::Engine
    isolate_namespace AstroEngine
    config.generators.api_only = true
  end
end
