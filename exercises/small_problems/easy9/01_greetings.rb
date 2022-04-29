def greetings(arr, hsh)
  name = arr.join(' ')
  professional = hsh.values.join(' ')
  "=> Hello, #{name}! Nice to have a #{professional} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.
