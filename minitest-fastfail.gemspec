# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'minitest-fastfail/version'

Gem::Specification.new do |gem|
  gem.name          = "minitest-fastfail"
  gem.version       = Minitest::Fastfail::VERSION
  gem.authors       = ["Chirantan Mitra"]
  gem.email         = ["chirantan.mitra@gmail.com"]
  gem.description   = %q{Report minitest error instantly}
  gem.summary       = %q{Show dots when tests pass, however each test failure procudes a full description of the failure}

  gem.files         = Dir.glob("lib/**/*") + %w(LICENSE README.md CHANGELOG.md)
  gem.test_files    = Dir.glob("spec/**/*")
  gem.require_paths = ["lib"]
end
