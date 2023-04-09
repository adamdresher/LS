# def count(list)
#   idx, total = 0, 0

#   until idx.equal? list.size
#     total += 1 if yield(list[idx])
#     idx += 1
#   end

#   total
# end

# def count(list)
#   total = 0
#   0.upto (list.size - 1) { |idx| total += 1 if yield(list[idx]) }
#   total
# end

# def count(list)
#   total = 0
#   list.each { |ele| total += 1 if yield(ele) }
#   total
# end

def count(list, &block) # Recursive approach
  total = 0
  idx = 0

  return total if idx == list.size
  total += 1 if yield(list[idx])
  idx += 1

  total += count(list[idx..-1], &block)
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
