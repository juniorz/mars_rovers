require 'minitest/autorun'
require 'plateau'

class PlateauTest < MiniTest::Unit::TestCase

  def test_it_has_dimensions
    plateau = Plateau.new(10, 3)

    assert_equal 10, plateau.width
    assert_equal 3, plateau.height
  end

end

