# iterate while block returns true
# once the block returns false, current element and all following elements are returned

def drop_while(arr)
  return arr.to_enum unless block_given?

  arr.each_with_index do |ele, idx|
    next if yield(ele)
    return arr[idx..-1]
  end
  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
p drop_while((1..10).to_a)