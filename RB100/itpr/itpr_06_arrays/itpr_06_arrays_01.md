Below we have given you an array and a number. Write a program that checks to see if the number appears in the array.
```
arr = [1, 3, 5, 7, 9, 11]
number = 3
```
##### MY SOLUTION
***Solution 1***
```
arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.each do |i|
  if i == number
    puts "#{number} was found."
  end
end
```

***Solution 2***
```
arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.map do |i|
  if i == number
    puts "#{number} was found."
  end
end
```

***Solution 3***
```
arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.collect do |i|
  if i == number
    puts "#{number} was found."
  end
end
```

***Solution 4***
```
arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.select do |i|
  if i == number
    puts "#{number} was found."
  end
end
```

***Solution 5***
```
arr = [1, 3, 5, 7, 9, 11]
number = 3

if arr.include?(number)
  puts "#{number} was found."
end
```