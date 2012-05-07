$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smurf/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smurf"
  s.version     = Smurf::VERSION
  s.authors     = ["Jakob Hilden", "Tim Schneider", "Stephan Pavlovic"]
  s.email       = ["jakobhilden@gmail.com"]
  s.homepage    = "https://github.com/railslove/smurf"
  s.summary     = "Conventions and tools for: Scalable, Modular, reUsable Rails Frontends -- SMURF"
  s.description = "SMURF is a new and modular approach to Rails frontend development based on the SMACSS approach for CSS.  This gem provides a set of tools that help following this approach."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "color"
  s.add_dependency "sass", "> 3.2.alpha"
  s.add_dependency "rails", "~> 3.1"
  s.add_dependency "haml"
end
