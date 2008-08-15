require File.dirname(__FILE__) + '/test_helper'

class MockObject
  attr_accessor :spooge_args
  
  def initialize
    @spooge_args = []
  end
  
  def spooge
    @spooge_args << true
  end
  
  def spooge_with_one_arg(arg)
    @spooge_args << [arg]
  end
  
  def spooge_with_two_args(arg1, arg2)
    @spooge_args << [arg1, arg2]
  end
  
  def spooge_with_three_args(arg1, arg2, arg3)
    @spooge_args << [arg1, arg2, arg3]
  end
  
  def spooge_with_four_args(arg1, arg2, arg3, arg4)
    @spooge_args << [arg1, arg2, arg3, arg4]
  end
end


class TestHelperTest < Test::Unit::TestCase
  include PassNils

  def setup
    @obj = MockObject.new
  end
  
  def test_pass_nils_to
    pass_nils_to(:spooge, @obj)
    assert [true], @obj.spooge_args
  end
  
  def test_pass_nils_to_with_one_arg
    pass_nils_to(:spooge_with_one_arg, @obj)
    assert_equal [["foo"], [nil]], @obj.spooge_args
  end
  
  def test_pass_nils_to_with_two_args
    pass_nils_to(:spooge_with_two_args, @obj)
    assert_equal [["foo", nil], [nil, "foo"], [nil, nil]], @obj.spooge_args
  end
  
  def test_pass_nils_to_with_three_args
    pass_nils_to(:spooge_with_three_args, @obj)
    expected = [
      ["foo", nil, nil],
      [nil, "foo", nil],
      [nil, nil, "foo"],
      ["foo", nil, "foo"],
      ["foo", "foo", nil],
      [nil, "foo", "foo"],
      [nil, nil, nil]
    ]
    assert_equal expected, @obj.spooge_args
  end
  
  def test_pass_nils_to_with_four_args
    pass_nils_to(:spooge_with_four_args, @obj)
    expected = [
      ["foo", nil, nil, nil],
      [nil, "foo", nil, nil],
      [nil, nil, "foo", nil],
      [nil, nil, nil, "foo"],
      ["foo", nil, "foo", "foo"],
      ["foo", "foo", nil, "foo"],
      ["foo", "foo", "foo", nil],
      [nil, "foo", "foo", "foo"],
      [nil, nil, nil, nil]
    ]
    assert_equal expected, @obj.spooge_args
  end
end
