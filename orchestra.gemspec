# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orchestra/version'

Gem::Specification.new do |gem|
  gem.name          = "orchestra"
  gem.version       = Orchestra::VERSION
  gem.authors       = ["Anthony Scalisi", "Jean-Richard Lai"]
  gem.email         = ["scalisi.a@gmail.com", "jrichardlai@gmail.com"]
  gem.description   = %q{SSH toolkit for application deployment and devops tasks.}
  gem.summary       = %q{Lightning fast deployment.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "mixlib-cli"
end
