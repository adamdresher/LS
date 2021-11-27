Given the following data structures, write a program that copies the information from the array into the empty hash that applies to the correct person.
```
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }
```

##### MY SOLUTION
```
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

def arr_to_hash(arr_sub)
  temp_hash = {
    email: arr_sub[0],
    address: arr_sub[1],
    phone: arr_sub[2]
  }
end

contacts["Joe Smith"] = arr_to_hash(contact_data[0])
contacts["Sally Johnson"] = arr_to_hash(contact_data[1])
p contacts
```
