[![Build Status](https://travis-ci.org/chiku/minitest-fastfail.png?branch=master)](https://travis-ci.org/chiku/minitest-fastfail)
[![Code Climate](https://codeclimate.com/github/chiku/minitest-fastfail.png)](https://codeclimate.com/github/chiku/minitest-fastfail)

# MiniTest FastFail

Run minitests in dot-format. However if tests fail show full scope, description and the relevant stack-trace.

## Installation

Add this line to your application's Gemfile:

    gem 'minitest-fastfail'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-fastfail

## Usage

Include the gem in your project

## Example output

### All success

```
# Running tests:

..

Finished tests in 0.004452s, 449.2363 tests/s, 673.8544 assertions/s.

2 tests, 3 assertions, 0 failures, 0 errors, 0 skips
```

### With failures

```
SE
BadTest
  0002 tests boom                                                             ERROR (0.00s)
     A random exception
     <..snip..>/minitest-fastfail/test/gallery/bad_spec.rb:20:in `block (2 levels) in <module:MiniTestReportersTest>'

F
BadTest
  0001 tests b                                                                FAIL (0.01s)
     --- expected
     +++ actual
     @@ -1,2 +1,2 @@
      "ab
     -d"
     +c"
     (eval):8:in `must_equal'
     <..snip..>/minitest-fastfail/test/gallery/bad_spec.rb:16:in `block (2 levels) in <module:MiniTestReportersTest>'

SF
BadTest::nested
  0001 tests a                                                                FAIL (0.00s)
     Expected: 2
       Actual: 1
     (eval):8:in `must_equal'
     <..snip..>/minitest-fastfail/test/gallery/bad_spec.rb:7:in `block (3 levels) in <module:MiniTestReportersTest>'

F
BadTest::nested
  0002 tests b                                                                FAIL (0.00s)
     Expected 1 to be even?.
     (eval):6:in `must_be'
     <..snip..>minitest-fastfail/test/gallery/bad_spec.rb:11:in `block (3 levels) in <module:MiniTestReportersTest>'

..

Finished tests in 0.021343s, 374.8302 tests/s, 281.1226 assertions/s.

8 tests, 6 assertions, 3 failures, 1 errors, 2 skips
```

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, but do not mess with the VERSION. If you want to have your own version, that is fine but bump the version in a commit by itself in another branch so I can ignore it when I pull.
* Send me a pull request.
