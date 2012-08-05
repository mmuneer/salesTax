require './tests/test_helper'
require './lib/input'
class InputTest < Test::Unit::TestCase
  context "Input" do
    setup do
      @str = "1 box of books at 14.50"
    end
    context "parse" do
      should "parse the input into appropiate format" do
       hsh ={}
       hsh[:name] = "box of books"
       hsh[:quantity] = "1"
       hsh[:price] = "14.50"
       assert_equal(Input.parse(@str),hsh)
      end
    end
  end
end