require_relative "../test_helper"

module MiniTestReportersTest
  describe "GoodTest" do
    describe "nested" do
      it "tests a" do
        1.must_equal 1
        1.must_be :odd?
      end
    end

    it "tests b" do
      "foo".upcase.must_equal "FOO"
    end
  end
end
