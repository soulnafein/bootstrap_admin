$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap_admin"
  s.version     = BootstrapAdmin::VERSION
  s.authors     = ["David Santoro"]
  s.email       = ["soulnafein@gmail.com"]
  s.homepage    = "http://www.github.com/soulnafein/bootstrap_admin"
  s.summary     = "Admin Tool for Rails 3 Apps"
  s.description = "An attempt to create a better admin tool"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.5"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
