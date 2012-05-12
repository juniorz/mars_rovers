class Heading

  VALID_HEADINGS = %W(N E S W)

  attr_reader :direction
  def initialize(direction)

    direction = direction.to_s.upcase

    throw ArgumentError.new("Invalid heading") unless VALID_HEADINGS.include?(direction)

    @direction = direction
  end

  def left!
    @direction = self.left
  end

  def left
    idx = VALID_HEADINGS.index(self.direction)
    next_heading_index = (VALID_HEADINGS.count + (idx - 1)) % VALID_HEADINGS.count
    VALID_HEADINGS[next_heading_index]
  end

  def right!
    @direction = self.right
  end

  def right
    idx = VALID_HEADINGS.index(self.direction)
    next_heading_index = (idx + 1) % VALID_HEADINGS.count
    VALID_HEADINGS[next_heading_index]
  end


end

