# def count(*objs)
#   if block_given?
#     counter = 0
#     objs.each { |obj| counter += 1 if yield(obj) }
#     counter
#   else
#     objs.size
#   end
# end

def count(*objs)
  if block_given?
    objs.inject(0) { |counter, obj| yield(obj) ? counter + 1 : counter }
  else
    objs.size
  end
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
p count(1, 3, 6) == 3
