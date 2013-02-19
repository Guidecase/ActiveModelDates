$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_model_dates"
  s.version     = "1.2.1"
  s.author      = 'Earlydoc'
  s.email       = 'developer@earlydoc.com'
  s.homepage    = 'https://www.earlydoc.com'  
  s.summary     = "Date helper toolkit for active model date field manipulation."
  s.description = "Date helper toolkit for active model date field manipulation."

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}  
  s.test_files   = Dir["test/**/*"]

  s.add_dependency "activesupport", "~> 3.2.11"
  s.add_development_dependency('mongomapper')
  s.add_development_dependency('activerecord')
end