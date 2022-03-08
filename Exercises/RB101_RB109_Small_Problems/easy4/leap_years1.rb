def valid_modulo?(year, cycle)
  year % cycle == 0
end

def leap_year?(year)
  if valid_modulo?(year, 4)
    if valid_modulo?(year, 100)
      valid_modulo?(year, 400)
    else
      true
    end
  else
    false
  end
end


# SOLUTION.  REFACTORED.
def valid_modulo?(year, cycle)
  year % cycle == 0
end

def leap_year?(year)
  secondary_check = valid_modulo?(year, 100) ? valid_modulo?(year, 400) : true
  
  valid_modulo?(year, 4) ? secondary_check : false
end
