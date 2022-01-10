# This program uses a `each` iterator method to output an array's values.

names = ['Finn', 'Jake', 'Princess Bubblegum', 'Marceline', 'Ice King', 'Lumpy']
# names.each {|name| puts name }

x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end