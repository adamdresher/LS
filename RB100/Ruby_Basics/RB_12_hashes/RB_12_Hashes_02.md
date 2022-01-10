## Adding the Year
#### Using the code below, add the key `:year` and the value `2003` to `car`.
```ruby
car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000
}
```
___
#### Solution
```ruby
car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000
}

car[:year] = 2003
```
___
#### Solution, LS
```ruby
car[:year] = 2003
```
#### Discussion
Modifying hash values is at the core of working with the hash data structure. With `Hash#[]=` it's possible to modify the value associated with an existing key or add a new key-value pair altogether. In our solution, we place the name of the desired key inside the brackets, like this: `[:year]`. This means we're selecting the key `:year` if it exists. If it doesn't exist, however, we need to provide a value, like `2003`, so that it will be created.

After adding the new key-value pair, `car` should look like this:
```ruby
car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000,
  year:    2003
}
```
___
#### Notes
