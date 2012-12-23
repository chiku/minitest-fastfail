require "minitest/unit"

module MiniTestFastFail
  # Based upon Alexander Kern's minitest-reporters (MIT License)
  # @see https://github.com/CapnKernul/minitest-reporters minitest-reporters

  require "minitest-fastfail/reporter"
  require "minitest-fastfail/fast_fail_reporter"
  require "minitest-fastfail/reporter_runner"
  require "minitest-fastfail/before_test_hook"
  require "minitest-fastfail/test_runner"

  module Reporters
    def self.use!(console_reporters = DefaultReporter.new)
      use_runner!(console_reporters)
      use_before_test_hook!
      use_parallel_length_method!
    end

    def self.use_runner!(console_reporters)
      runner = MiniTestFastFail::ReporterRunner.new
      runner.reporters = Array(console_reporters)
      MiniTest::Unit.runner = runner
    end

    def self.use_before_test_hook!
      # available since 3.3.0
      MiniTest::Unit::TestCase.send(:include, MiniTestFastFail::BeforeTestHook)
    end

    def self.use_parallel_length_method!
      # available since 4.2.0
      ::ParallelEach.send(:define_method, :length) do
        @queue.length
      end
    end
  end
end
