require_relative "../test_helper"

module MiniTestReportersTest
  describe "BadTest" do
    describe "nested" do
      it "tests a" do
        1.must_equal 2
      end

      it "tests b" do
        1.must_be :even?
      end
    end
  
    it "tests b" do
      "ab\nc".must_equal("ab\nd")
    end

    it "tests boom" do
      raise "A random exception"
    end

    it "tests a method name" do
      skip
    end

    it "tests a longer method name" do
      skip "with message"
    end
  end
end
