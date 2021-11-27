key_names = [:email, :address, :phone]
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" =>{}}
=begin
def filling_contacts(keys, values)
  temp_hash = Hash.new
  keys.select { |k| temp_hash[k] = values.shift }
  temp_hash
end

contacts["Joe Smith"] = filling_contacts(key_names, contact_data)
=end
=begin
contacts.each do |key, value|
  key_names.each do |key_name|
    value[key_name] = contact_data.shift
  end
end

p contacts
=end

contacts.each_with_index do |(key, value), idx|
  key_names.each do |key_name|
    value[key_name] = contact_data[idx].shift
  end
end

p contacts
