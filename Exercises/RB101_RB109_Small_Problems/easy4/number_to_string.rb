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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
