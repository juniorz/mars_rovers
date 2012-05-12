require 'minitest/autorun'
require 'heading'

class HeadingTest < MiniTest::Unit::TestCase

  def test_that_it_has_valid_direction
    assert_raises ArgumentError do
      Heading.new('Z')
    end

    heading = Heading.new('N')
    assert_equal 'N', heading.direction

  end

  def test_that_it_can_turn_left
    heading = Heading.new('N')

    heading.left!
    assert_equal 'W', heading.direction

    heading.left!
    assert_equal 'S', heading.direction

    heading.left!
    assert_equal 'E', heading.direction

    heading.left!
    assert_equal 'N', heading.direction
  end

  def test_that_it_can_turn_right
    heading = Heading.new('N')

    heading.right!
    assert_equal 'E', heading.direction

    heading.right!
    assert_equal 'S', heading.direction

    heading.right!
    assert_equal 'W', heading.direction

    heading.right!
    assert_equal 'N', heading.direction
  end

  def test_that_it_can_move
  end

#  def test_that_kitty_can_eat
#    assert_equal "OHAI!", @meme.i_can_has_cheezburger?
#  end

#  def test_that_it_will_not_blend
#    refute_match /^no/i, @meme.will_it_blend?
#  end
end

