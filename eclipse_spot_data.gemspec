# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eclipse_spot/data/version'

Gem::Specification.new do |gem|
  gem.name          = "eclipse_spot_data"
  gem.version       = EclipseSpot::Data::VERSION
  gem.authors       = ["Benoit Molenda"]
  gem.email         = ["benoit.molenda@gmail.com"]
  gem.description   = %q{Yml data for EclipsePhase RPG created by EclipseSpot.com & CO}
  gem.summary       = %q{Yml data for EclipsePhase RPG created by EclipseSpot.com & CO usable as a Ruby Gem or Standalone}
  gem.homepage      = "https://github.com/proxygear/eclipse_spot_data"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'shoulda' # Shoulda
  gem.add_development_dependency 'shoulda-matchers'
  gem.add_development_dependency 'faker'
  gem.add_development_dependency 'ruby-prof' # perf
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'rspec-mocks'
  gem.add_development_dependency 'guard-bundler'
  gem.add_development_dependency 'dotenv'

  # Spork
  gem.add_development_dependency 'spork'
  gem.add_development_dependency 'guard-spork'

  # Auto Test launch
  gem.add_development_dependency 'guard-rspec'
  
  #s.add_development_dependency 'binding_of_caller'
  gem.add_development_dependency 'debugger'
end
