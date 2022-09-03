=begin
class Length
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  def ==(other)
    case unit
    when :km  then value == other.as_kilometers.value
    when :mi  then value == other.as_miles.value
    when :nmi then value == other.as_nautical_miles.value
    end
  end

  def <(other)
    case unit
    when :km  then value < other.as_kilometers.value
    when :mi  then value < other.as_miles.value
    when :nmi then value < other.as_nautical_miles.value
    end
  end

  def <=(other)
    self < other || self == other
  end

  def >(other)
    !(self <= other)
  end

  def >=(other)
    self > other || self == other
  end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi
=end

=begin
Line 63 raises an `ArgumentError` due to the the implementation of
`Enumerable#sort`.  `#sort` uses `#<=>` to reorder its caller's elements.  More
specifically, `#<=>` is invoked by the caller's elements and thus determine the
implementation of `<=>`.
In this example `Length#<=>` has not been defined, so `Object#<=>` is invoked.
However `Object#<=>` simply compares if the caller and argument are the same
object, then returns `0` or `nil` (this particular method is designed to be
expanded on by subclasses).  The methods `#==`, `#<`, `#<=`,`#>`, and `#>=` do
not serve a purpose currently.
To resolve this `Exception`, `Length#<=>` should be defined with case block 
similar to the implementation in `#<`.
=end

class Length

  # ...

  def <=> (other)
    case unit
    when :km  then value <=> other.as_kilometers.value
    when :mi  then value <=> other.as_miles.value
    when :nmi then value <=> other.as_nautical_miles.value
    end
  end
end
