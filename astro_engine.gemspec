$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "astro_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "astro_engine"
  spec.version     = AstroEngine::VERSION
  spec.authors     = ["Jack Miles"]
  spec.email       = ["caseyjackmiles@gmail.com"]
  spec.homepage    = "https://github.com/caseyjackmiles/astro_engine"
  spec.summary     = "Provides ASTRO data."
  spec.description = "A Rails plugin providing ASTRO data."
  spec.license     = "MIT"
  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.0.beta3"

  spec.add_development_dependency "sqlite3"
end
