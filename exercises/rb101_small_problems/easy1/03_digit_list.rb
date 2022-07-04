def digit_list(num)
  if num.to_i != num
    puts "Sorry, only integers are accepted in this method."
    return
  elsif num.negative?
    puts "Sorry, only natural numbers are accepted in this method."
    return
  end

  num.digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
