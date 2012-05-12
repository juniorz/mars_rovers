require 'heading'
#require 'position'

class Rover

  attr_reader :plateau, :x, :y
  def initialize()
  end

  def land(plateau)
    @plateau = plateau
  end

  def turn_left
    @heading.left!
  end

  def turn_right
    @heading.right!
  end

  def move
    case self.heading
      when 'N'
        move_north
      when 'S'
        move_south
      when 'E'
        move_east
      when 'W'
        move_west
    end
  end

  def heading=(head)
    @heading = Heading.new(head)
    self.heading
  end

  def heading
    @heading && @heading.direction
  end

  def position(x, y)
    @x = x
    @y = y
  end

  def landed_at
    @plateau
  end

  private
    def move_north
      @y = self.y + 1
    end

    def move_south
      @y = self.y - 1
    end

    def move_east
      @x = self.x + 1
    end

    def move_west
      @x = self.x - 1
    end
end

