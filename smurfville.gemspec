$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smurfville/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smurfville"
  s.version     = Smurfville::VERSION
  s.authors     = ["Jakob Hilden", "Tim Schneider", "Stephan Pavlovic"]
  s.email       = ["jakobhilden@gmail.com"]
  s.homepage    = "https://github.com/railslove/smurfville"
  s.summary     = "Conventions and tools for: Scalable, Modular, reUsable Rails Frontends -- SMURF"
  s.description = "Smurfville is the home of SMURF, a new and modular approach to Rails frontend development based on the SMACSS approach for CSS.  This gem provides a set of tools that help following this approach."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "color"
  s.add_dependency "sass", "~> 3.2"
  s.add_dependency "rails", ">= 3.1"
  s.add_dependency "haml"
end