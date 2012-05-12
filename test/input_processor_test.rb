require 'minitest/autorun'
require 'input_processor'
require 'stringio'

class InputProcessorTest < MiniTest::Unit::TestCase

  def test_reads_plateau_input
    input = <<EOF
3 4
EOF
    processor = InputProcessor.new(input)
    plateau = processor.plateau

    assert_equal 3, plateau.width
    assert_equal 4, plateau.height
  end

  def test_reads_rover
    input = <<EOF
5 6
7 8 N
EOF

    processor = InputProcessor.new(input)
    rover = processor.rovers.first

    assert_equal 7, rover.x
    assert_equal 8, rover.y
    assert_equal 'N', rover.heading
  end


  def test_reads_rover_moves
    input = <<EOF
10 10
7 8 N
MM
EOF

    processor = InputProcessor.new(input)
    rover = processor.rovers.first

    assert_equal 7, rover.x
    assert_equal 8, rover.y
    assert_equal 'N', rover.heading

    processor.move_rover(0)

    assert_equal 7, rover.x
    assert_equal 10, rover.y
    assert_equal 'N', rover.heading
  end


  def test_output
    input = <<EOF
10 10
7 8 N
MM
EOF

    output = StringIO.new

    processor = InputProcessor.new(input, output)
    rover = processor.rovers.first

    assert_equal 7, rover.x
    assert_equal 8, rover.y
    assert_equal 'N', rover.heading

    processor.process

    out = <<EOF
7 10 N
EOF

    assert_equal out, output.string
  end

  def test_first_example
    input = <<EOF
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
EOF

    output = StringIO.new

    processor = InputProcessor.new(input, output)
    processor.process

    out = <<EOF
1 3 N
5 1 E
EOF

    assert_equal out, output.string
  end


  def test_warns_if_leaves_plateau
    input = <<EOF
5 5
1 2 N
LMMMMM
EOF

    output = StringIO.new
    err = StringIO.new

    processor = InputProcessor.new(input, output, err)
    processor.process

    out = <<EOF
-4 2 W
EOF

    assert_equal out, output.string
  end


end

