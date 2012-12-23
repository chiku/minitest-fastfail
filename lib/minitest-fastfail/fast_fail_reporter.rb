module MiniTestFastFail
  # Runner for MiniTest that supports reporters.
  #
  # Based upon Alexander Kern's minitest-reporters (MIT License)
  # @see https://github.com/CapnKernul/minitest-reporters minitest-reporters
  # 
  # which is in-turn
  # Based upon Ryan Davis of Seattle.rb's MiniTest (MIT License).
  #
  # @see https://github.com/seattlerb/minitest MiniTest
  class FastFailReporter < Reporter
    TEST_PADDING = 2
    TEST_SIZE = 76
    MARK_SIZE = 3
    INFO_PADDING = 5

    def initialize(options = {})
      @detailed_skip = options.fetch(:detailed_skip, true)
    end

    def before_suites(suites, type)
      puts
      puts "# Running #{type}s:"
      puts
    end

    def before_test(suite, test)
      @test_name = "#{suite}##{test}"
      print "#{@test_name} = " if verbose?
    end

    def pass(suite, test, test_runner)
      after_test('.')
    end

    def skip(suite, test, test_runner)
      after_test('S')
    end

    def failure(suite, test, test_runner)
      after_test('F')

      puts
      puts suite.name
      print pad_test(naturalize(test))
      print(pad_mark('FAIL'))
      print_time(test)
      puts
      print_info(test_runner.exception)
      puts
    end

    def error(suite, test, test_runner)
      after_test('E')

      puts
      puts suite.name
      print pad_test(naturalize(test))
      print(pad_mark('ERROR'))
      print_time(test)
      puts
      print_info(test_runner.exception)
      puts
    end

    def after_suite(suite)
    end

    def after_suites(suites, type)
      time = Time.now - runner.suites_start_time
      status_line = "Finished %ss in %.6fs, %.4f tests/s, %.4f assertions/s." %
        [type, time, runner.test_count / time, runner.assertion_count / time]

      puts
      puts
      puts status_line

      puts
      print result_line
    end

    private

    def suite_result
      case
      when runner.failures > 0; :failure
      when runner.errors > 0; :error
      when runner.skips > 0; :skip
      else :pass
      end
    end

    def after_test(result)
      time = Time.now - runner.test_start_time

      print '%.2f s = ' % time if verbose?
      print result
      puts if verbose?
    end

    def location(exception)
      last_before_assertion = ''

      exception.backtrace.reverse_each do |s|
        break if s =~ /in .(assert|refute|flunk|pass|fail|raise|must|wont)/
        last_before_assertion = s
      end

      last_before_assertion.sub(/:in .*$/, '')
    end

    def message_for(test_runner)
      suite = test_runner.suite
      test = test_runner.test
      e = test_runner.exception

      case test_runner.result
      when :pass then nil
      when :skip
        if @detailed_skip
          "Skipped:\n#{test}(#{suite}) [#{location(e)}]:\n#{e.message}\n"
        end
      when :failure then "Failure:\n#{test}(#{suite}) [#{location(e)}]:\n#{e.message}\n"
      when :error
        bt = filter_backtrace(test_runner.exception.backtrace).join "\n    "
        "Error:\n#{test}(#{suite}):\n#{e.class}: #{e.message}\n    #{bt}\n"
      end
    end

    def result_line
      "%d tests, %d assertions, %d failures, %d errors, %d skips\n\n" %
        [runner.test_count, runner.assertion_count, runner.failures, runner.errors, runner.skips]
    end
    
    def print_time(test)
      total_time = Time.now - runner.test_start_time
      print(" (%.2fs)" % total_time)
    end

    def print_info(e)
      e.message.each_line { |line| puts pad(line, INFO_PADDING) }

      trace = filter_backtrace(e.backtrace)
      trace.each { |line| puts pad(line, INFO_PADDING) }
    end
    
    def pad(str, size)
      ' ' * size + str
    end
    
    def pad_mark(str)
      "%#{MARK_SIZE}s" % str
    end

    def pad_test(str)
      pad("%-#{TEST_SIZE}s" % str, TEST_PADDING)
    end
    
    # Natural names for tests (without underscore)
    #
    # Based upon Tim Pease's Turn
    # @see https://github.com/TwP/turn
    def naturalize(name)
      name.gsub("test_", "").gsub(/_/, " ")
    end
  end
end
