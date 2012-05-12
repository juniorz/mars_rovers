require 'minitest/autorun'
require 'rover'
require 'plateau'

class RoverTest < MiniTest::Unit::TestCase

  def test_that_it_has_heading
    rover = Rover.new

    assert_raises ArgumentError do
      rover.heading = 'Z'
    end

    rover.heading = 'N'
    assert_equal 'N', rover.heading
  end

  def test_that_it_can_turn_left
    rover = Rover.new
    rover.heading = 'N'

    rover.turn_left
    assert_equal 'W', rover.heading
  end

  def test_that_it_can_turn_right
    rover = Rover.new
    rover.heading = 'N'

    rover.turn_right
    assert_equal 'E', rover.heading
  end

  def test_that_it_has_position
    rover = Rover.new
    rover.position(1, 2)

    assert_equal 1, rover.x
    assert_equal 2, rover.y
  end

  def test_that_it_can_move
    rover = Rover.new
    rover.heading = 'N'
    rover.position(0, 0)

    rover.move

    assert_equal 0, rover.x
    assert_equal 1, rover.y
    assert_equal 'N', rover.heading

    rover.turn_right
    rover.move

    assert_equal 1, rover.x
    assert_equal 1, rover.y
    assert_equal 'E', rover.heading

    rover.turn_left
    rover.move

    assert_equal 1, rover.x
    assert_equal 2, rover.y
    assert_equal 'N', rover.heading

    rover.turn_left
    rover.move

    assert_equal 0, rover.x
    assert_equal 2, rover.y
    assert_equal 'W', rover.heading

    rover.turn_left
    rover.move

    assert_equal 0, rover.x
    assert_equal 1, rover.y
    assert_equal 'S', rover.heading
  end

end

