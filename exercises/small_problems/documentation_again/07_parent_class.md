### Understanding the Problem
Modify the code to output only the public methods that are defined by `String`, excluding all superclasses (`Object`, `BasicObject`, and `Kernel`).
Input given is a string.
Output expected is an array.

### Mental Model

- List the String class's public methods and assign them as an array variable, `string_methods`.  Repeat this for Object class's public methods, assigning these to the variable, `object_methods`.  Then, compare the two arrays.  If there are any matches, delete the element from `string_methods` and output array.

### Data Structures:
Array.

### Algorithm

- Assign `s` to `string_methods`
- Return its class
- List its public methods as an array
- Assign `object_methods` using the `Object` class
- List its public methods as an array
- Iterate through `object_methods`
  - If the element is found within `string_methods`
    - Then delete the element
- Return elements not deleted

### Code
```ruby
string_methods = s.class.public_methods
object_methods = Object.public_methods

object_methods.map { |method|  string_methods.delete(method)}
# => [:try_convert]

# Solution 2.
s.public_methods(false)
```
