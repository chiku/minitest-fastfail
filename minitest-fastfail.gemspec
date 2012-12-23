# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "minitest-fastfail/version"

Gem::Specification.new do |gem|
  gem.name          = "minitest-fastfail"
  gem.version       = MiniTestFastFail::VERSION
  gem.authors       = ["Chirantan Mitra"]
  gem.email         = ["chirantan.mitra@gmail.com"]
  gem.description   = %q{Report minitest errors and failures instantly}
  gem.summary       = %q{Show a dot for each passing test. Show full description for each tests that fail or have errors.}

  gem.files         = Dir.glob("lib/**/*") + %w(LICENSE README.md CHANGELOG.md)
  gem.test_files    = Dir.glob("spec/**/*")
  gem.require_paths = ["lib"]

  gem.add_dependency 'minitest', '>= 4.2.0'

  gem.add_development_dependency 'rake'
end
