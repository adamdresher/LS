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
