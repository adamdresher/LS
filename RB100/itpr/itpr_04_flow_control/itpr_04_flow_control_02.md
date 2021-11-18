Write a method that takes a string as an argument. The method should return a new, all-caps version of the string, only if the string is longer than 10 characters. Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)


##### MY SOLUTIONS
```
def return_caps(s)
  if s.length > 10
    p s.to_s.upcase
  else
    p "Sorry, that argument is too short."
  end
end

return_caps("under 10")
return_caps("well over 10")
```

***Refactored***
```
def return_caps(s)
  p s.length > 10 ? s.to_s.upcase : "Sorry, that argument is too short."
  end

return_caps("Under 10.")
return_caps("This is over 10.")
```
