class RomanNumeral
  ROMAN_LIBRARY = # top lvl keys represent power of individual digits
    {             # nested keys represent individual digits
      0 => { (1..3) => 'I', (4..4) => 'IV', (5..8) => 'V', (9..9) => 'IX' },
      1 => { (1..3) => 'X', (4..4) => 'XL', (5..8) => 'L', (9..9) => 'XC' },
      2 => { (1..3) => 'C', (4..4) => 'CD', (5..8) => 'D', (9..9) => 'CM' },
      3 => { (1..3) => 'M' }
    }

  def initialize(num)
    @num = num
  end

  def to_roman
    roman_num = ""

    @num.digits
        .map
        .with_index { |num, idx| roman_num.prepend num_to_roman(num, idx) }
    roman_num
  end

  private

  def num_to_roman(num, power)
    return '' if num == 0

    quotnt, remainder = num.divmod(5)

    case remainder
    when 4
      roman_chars(num, power)
    when (1..)
      roman_chars(num, power, quotnt) + roman_chars(remainder, power, remainder)
    else
      roman_chars(num, power, quotnt)
    end
  end

  def roman_chars(num, power, multiplier=1)
    ROMAN_LIBRARY[power][num_to_range(num, power)] * multiplier
  end

  def num_to_range(num, power)
    ROMAN_LIBRARY[power].keys
                        .select { |key| key.include? num }
                        .first
  end
end
