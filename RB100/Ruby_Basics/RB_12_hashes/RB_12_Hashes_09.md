## Multiple Cars
#### Create a nested hash using the following data.
**Car**
| type	| color |	year |
| ----- | ----- | ---- |
| sedan	| blue  |	2003 |

**Truck**
| type  	| color |	year |
| ------- | ----- | ---- |
| pickup	| red   |	1998 |
___
#### Solution
```ruby
# SOLUTION 1.
car = {
  type: 'sedan',
  color: 'blue',
  year: 2003
}
p car

truck = {
  type: 'pickup',
  color: 'red',
  year: 1998
}
p truck

vehicles = {
  car: car,
  truck: truck
}
p vehicles


# SOLUTION 2.  DEFINING METHODS.
vehicle = Hash.new

def vehicle_template(type, color, year)
  vehicle = {
    type: type,
    color: color,
    year: year
  }
end

vehicle[:car] = vehicle_template('sedan', 'blue', 2003)
vehicle[:truck] = vehicle_template('pickup', 'red', 1998)
p vehicle
```
___
#### Solution, LS
```ruby
{
  car:   { type: 'sedan', color: 'blue', year: 2003 },
  truck: { type: 'pickup', color: 'red', year: 1998 }
}
```
#### Discussion
Just as you can nest arrays, you can also nest hashes. Once you understand clearly how key-value pairs work, you'll realize that keys and values can be any form of object. In our solution, the value of `:truck` is:

```ruby
{ type: 'pickup', color: 'red', year: 1998 }
```
The value is the entire hash even though the nested hash contains its own key-value pairs.
___
#### Notes
