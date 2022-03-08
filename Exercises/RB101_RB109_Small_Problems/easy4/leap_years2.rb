def valid_modulo?(year, cycle)
  year % cycle == 0
end

def gregorian_leap_year?(year)
  secondary_check = valid_modulo?(year, 100) ? valid_modulo?(year, 400) : true
  
  valid_modulo?(year, 4) ? secondary_check : false
end

def leap_year?(year)
  year <= 1752 ? valid_modulo?(year, 4) : gregorian_leap_year?(year)
  end
end
