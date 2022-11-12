class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]

    raise ArgumentError if invalid_triangle?
  end

  def kind
    case @sides.uniq.count
    when 1 then return 'equilateral'
    when 2 then return 'isosceles'
    else        return 'scalene'
    end
  end

  private

  def invalid_triangle?
    @sides.any? { |side| side <= 0 } ||
    @sides.any? { |side| (@sides.sum - side) <= side }
  end
end
