require "bundler/setup"
require "minitest/autorun"

require "minitest-fastfail"

module MiniTestReportersTest
  class TestCase < MiniTest::Unit::TestCase
  end
end

# Testing the built-in reporters using automated unit testing would be extremely
# brittle. Consequently, there are no unit tests for them. If you'd like to run
# the fastfail reporter sequentially on a fake test suite, run `rake test:all spec:all`.
