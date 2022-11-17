class Series
  def initialize(string)
    @string_of_num = string # preserved to error on the side of precautious
    @numbers = string.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > @numbers.length

    difference = @numbers.length - length
    (0..difference).map { |idx| @numbers[idx, length] }
  end
end
