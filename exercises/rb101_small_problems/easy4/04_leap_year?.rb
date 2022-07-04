# frozen_string_literal: true

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

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
