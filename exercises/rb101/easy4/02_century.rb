# frozen_string_literal: true

def century(year)
  century = (year - 1).digits.reverse
  2.times { century.pop }
  century = (century.join.to_i + 1).to_s

  if century.end_with?('11', '12', '13')
    century << 'th'
  else
    case century[-1]
    when '1' then century << 'st'
    when '2' then century << 'nd'
    when '3' then century << 'rd'
    else          century << 'th'
    end
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
