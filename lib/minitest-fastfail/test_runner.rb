module MiniTestFastFail
  TestRunner = Struct.new(:suite, :test, :assertions, :time, :result, :exception)
end
