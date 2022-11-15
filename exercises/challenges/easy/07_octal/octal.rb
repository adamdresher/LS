class Octal
  def initialize(string)
    @base8 = string
  end

  def to_decimal
    base8 = @base8.chars.reverse

    return 0 if base8.any? { |char| !('0'..'7').include? char }

    base8.map.with_index { |num, idx| num.to_i * 8**idx }.sum
  end
end
