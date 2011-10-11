# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ftpr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Patrik Stenmark"]
  gem.email         = ["patrik@stenmark.io"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "ftpr"
  gem.require_paths = ["lib"]
  gem.version       = Ftpr::VERSION
  gem.add_runtime_dependency('ffi', '~> 1.0')
  gem.add_development_dependency('rspec', '~> 2.6.0')
  gem.add_development_dependency('fake_ftp')

end

