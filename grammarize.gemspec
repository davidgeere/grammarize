$:.push File.expand_path("../lib", __FILE__)

require "grammarize/version"

Gem::Specification.new do |s|
  s.name        = 'grammarize'
  s.version     = Grammarize::VERSION
  s.summary     = "Grammarize"
  s.description = "I really needed something easy to do some grammar inflections, so I started putting this together."
  s.authors     = ["Daybear, Inc."]
  s.email       = 'engineering@daybear.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'https://github.com/daybear/grammarize'
  s.license     = 'MIT'
end
