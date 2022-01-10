number = 0

until number == 10
  number += 1
  puts number.even? ? number : next
end
