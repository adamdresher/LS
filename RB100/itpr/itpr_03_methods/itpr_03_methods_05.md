1) Edit the method definition in exercise #4 so that it does print words on the screen.
2) What does it return now?

##### MY SOLUTION
```
def scream(words)
  words = words + "!!!!"
  # return
  puts words
end

scream("Yippeee")
```

Removing ```return``` allows the method to continue.
This change alone outputs "Yippeee!!!!" and returns ```nil```.
