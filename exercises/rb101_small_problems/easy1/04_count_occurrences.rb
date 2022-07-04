def count_occurrences(list)
  output = list.uniq
  output.map! { |element| [element, list.count(element)] }
  output.each { |element| puts "#{element[0]} => #{element[1]}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2