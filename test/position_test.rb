require 'minitest/autorun'
require 'position'

class PositionTest < MiniTest::Unit::TestCase

  def test_constructor
    pos = Position.new(10, 11)

    assert_equal 10, pos.x
    assert_equal 11, pos.y
  end

end

