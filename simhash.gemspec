$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

include_files = ["README*", "LICENSE", "Rakefile", "init.rb", "{lib,rails,ext}/**/*"].map do |glob|
  Dir[glob]
end.flatten
exclude_files = ["**/*.o", "**/*.bundle", "**/Makefile", "*.bundle" ].map do |glob|
  Dir[glob]
end.flatten

spec = Gem::Specification.new do |s|
  s.name              = "mort666_simhash"
  s.version           = "0.2.6"
  s.author            = ["Alex Gusev", "Stephen Kapp"]
  s.email             = ["alex.gusev@bookmate.ru", "skapp@cortexinsight.com"]
  s.homepage          = "http://github.com/mort666/simhash"
  s.description       = "Implementation of Charikar simhashes in Ruby"
  s.platform          = Gem::Platform::RUBY
  s.summary           = "Gives you possbility to convert string into simhashes to futher use: finding near-duplicates, similar strings, etc."
  s.files             = include_files - exclude_files
  s.require_path      = "lib"
  s.test_files        = Dir["test/**/test_*.rb"]
  s.extensions        = ["ext/string_hashing/extconf.rb"] 
  
  s.add_dependency "activesupport"
  s.add_dependency "unicode"

  s.add_development_dependency "bundler", "~> 1.6"
  s.add_development_dependency "minitest"
  s.add_development_dependency "rake"
end