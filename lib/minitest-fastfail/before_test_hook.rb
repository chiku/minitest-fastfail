module MiniTestFastFail
  # Based upon Alexander Kern's minitest-reporters (MIT License)
  # @see https://github.com/CapnKernul/minitest-reporters minitest-reporters

  module BeforeTestHook
    def self.before_test(instance)
      runner = MiniTest::Unit.runner

      if runner.respond_to?(:before_test)
        runner.before_test(instance.class, instance.__name__)
      end
    end

    def before_setup
      BeforeTestHook.before_test(self)
      super
    end
  end
end
