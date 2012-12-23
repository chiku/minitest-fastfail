module MiniTestFastFail
  # Based upon Alexander Kern's minitest-reporters (MIT License)
  # @see https://github.com/CapnKernul/minitest-reporters minitest-reporters

  class Reporter
    def runner
      MiniTest::Unit.runner
    end

    def filter_backtrace(backtrace)
      MiniTest.filter_backtrace(backtrace)
    end

    def output
      runner.output
    end

    def verbose?
      runner.verbose
    end

    def print(*args)
      runner.output.print(*args)
    end

    def puts(*args)
      runner.output.puts(*args)
    end

    def before_suites(suites, type); end
    def before_suite(suite); end
    def before_test(suite, test); end
    def pass(suite, test, test_runner); end
    def skip(suite, test, test_runner); end
    def failure(suite, test, test_runner); end
    def error(suite, test, test_runner); end
    def after_suite(suite); end
    def after_suites(suites, type); end
  end
end
