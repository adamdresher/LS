=begin
Problem:
Create a program that determines whether a triangle is equilateral, isosceles, or scalene.
- Equilateral triangles have all 3 sides of equal length
- Isosceles triangles have 2 sides of the same length
- Scalene triangles have all sides of different length
- All triangles:
  - all sides are greater than 0
  - sum of any 2 sides must be greater than the 3rd

Example:
````
def test_equilateral_equal_sides
  triangle = Triangle.new(2, 2, 2)
  assert_equal 'equilateral', triangle.kind
end

def test_size_inequality_is_illegal_4
  skip
  assert_raises(ArgumentError) do
    triangle = Triangle.new(1, 1, 2)
end
```

- class name is Triangle
- Triangle class has the instance method `#kind`
  - `Triangle#kind` returns one of 3 strings: 'equilateral', 'isosceles', or 'scalene'
  - `Triangle#initialize` requires 3 integers: sides of the triangle
- `ArgumentError` is raised if the arguments passed to `Triangle#initialize` do not define a valid triangle

Data Structure:
- sides are referenced individually by instance variables
- sides are referenced as elements of an array by an instance variable

triangle rules are stored as private methods

Algorithm:
- Triangle class
  - instance variables
    - side1, side2, side3
  - `#initialize`
    - requires 3 integer arguments
    - initializes instance variable to arguments
    - raise ArgumentError if arguments do not define a valid triangle
      - `#valid_triangle?`
  - `#kind`
    - returns equilateral if sides define equilateral
    - returns isosceles if sides define isosceles
    - else returns scalene
  - `#valid_triangle?`
    - all sides are greater than 0
    - all sides are less than the sum of the other 2 sides
  - `#equilateral?` # refactored logic into #kind
    - all sides are the same
  - `#isosceles?` # refactored logic into #kind
    - 2 sides are the same
=end

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
