## Weather Forecast
#### Our `predict_weather` method should output a message indicating whether a sunny or cloudy day lies ahead. However, the output is the same every time the method is invoked. Why? Fix the code so that it behaves as expected.
```ruby
def predict_weather
  sunshine = ['true', 'false'].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end
```
___
#### Solution
```ruby
def predict_weather
  sunshine = ['true', 'false'].sample

  if sunshine == 'true'
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end
```
The problem is that `sunshine` returns a string, `'true'` or `'false'`.  This is not the same as the boolean value `true` or `false`.  And `if sunshine` is evaluating whether the variable `sunshine` has a `true` or `false` value.  Because all `Strings` are truthy, `if sunshine` will always be `true`.  Thus the `else` statement is never invoked and we have a groundhog's day.  :dizzy_face:
___
#### Solution, LS
```ruby
def predict_weather
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end
```
#### Discussion
In order for the method to behave as expected, we should assign `sunshine` to the *Boolean* `true` or `false` instead of the string `'true'` or `'false'`.
___
#### Notes
