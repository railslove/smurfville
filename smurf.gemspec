$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smurf/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smurf"
  s.version     = Smurf::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Smurf."
  s.description = "TODO: Description of Smurf."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
