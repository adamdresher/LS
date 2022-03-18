DIGITS = [
  [0, '0'], [1, '1'], [2, '2'], [3, '3'], [4, '4'],
  [5, '5'], [6, '6'], [7, '7'], [8, '8'], [9, '9']
]

def integer_to_string(integer)
  int = integer
  string = ''
  digit = 0
  
  if integer == 0 then return '0' end

  until int == 0
    int, digit = int.divmod(10)
    
    DIGITS.each do |set|
      string << set[1] if digit == set[0]
    end
  end

  string.reverse
end

def signed_integer_to_string(integer)
  string = integer_to_string(integer.abs)

  case integer <=> 0
  when  1 then string.prepend('+')
  when -1 then string.prepend('-')
  else         string
  end
end


# SOLUTION.  FURTHER EXPLORATION.
def signed_integer_to_string(integer)
  string = integer_to_string(integer.abs)

  case integer <=> 0
  when  1 then "+#{string}"
  when -1 then "-#{string}"
  else             string
  end
end
