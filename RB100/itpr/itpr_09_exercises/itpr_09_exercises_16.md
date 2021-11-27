**Challenge:** In exercise 11, we manually set the `contacts` hash values one by one. Now, programmatically loop or iterate over the `contacts` hash from exercise 11, and populate the associated data from the `contact_data` array. Hint: you will probably need to iterate over (`[:email`, `:address`, `:phone]`), and some helpful methods might be the Array `shift` and `first` methods.

Note that this exercise is only concerned with dealing with 1 entry in the contacts hash, like this:

```
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
```

As a bonus, see if you can figure out how to make it work with multiple entries in the contacts hash.

##### MY SOLUTION
```
key_names = [:email, :address, :phone]
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" =>{}}

# LS's idea for interating through multiple sub hashs and sub arrays.  `each_with_index` was not found in Ruby documentation.  It has me wondering why this method isn't listed in the documentation and if there is a more complete source.
contacts.each_with_index do |(key, value), idx|
  key_names.each do |key_name|
    value[key_name] = contact_data[idx].shift
  end
end

p contacts
```
