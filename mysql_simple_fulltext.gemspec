$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mysql_simple_fulltext/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mysql_simple_fulltext"
  s.version     = MysqlSimpleFulltext::VERSION
  s.authors     = ["Gilles ROUSTAN"]
  s.email       = ["gilles.roustan@gmail.com"]
  s.homepage    = "https://github.com/groustan/mysql_simple_fulltext"
  s.summary     = "MysqlSimpleFulltext"
  s.description = "MysqlSimpleFulltext lets you make simple MySQL fulltext searches a simple way without writing SQL queries in your ActiveRecord."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"

  s.add_development_dependency "mysql2"
end
