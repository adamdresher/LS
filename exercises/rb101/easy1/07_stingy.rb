def stringy(num)
  string = ''
  
  num.times do
    if string.end_with? '1'
      string << '0'
    else
      string << '1'
    end
  end
  string
end

# Solution 2.
def stringy(num)
  string = ''
  
  num.times do
    string.end_with? '1' ? string << '0' : string << '1'
  end
  string
end

# Solution 2.  Further Exploration.
def stringy(num, start = '1')
  string = start
  
  (num - 1).times do
    (string.end_with? '1') ? string << '0' : string << '1'
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
