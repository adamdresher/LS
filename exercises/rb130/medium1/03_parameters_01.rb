items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

def gather(items, &block)
  puts "Let's start gathering food."
  block.call(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| puts "#{items.join(', ')}" }

# This implementation is more consistent by requiring all expressions to output
def gather_and_display(items)
  puts "Let's start gathering food."
  puts yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| "#{items.join(', ')}" }

# Forces the block to work with a single element at a time
def gather_each(items)
  puts "Let's start gathering food."
  items.each { |item| yield(item) }
  puts "Nice selection of food we have gathered!"
end

gather_each(items) do |item|
  idx = items.index(item)
  print (items[idx + 1] ? "#{item}, " : "#{item}\n" )
end
