# def odd_num
#   count = 0
#   while count <= 99
#     Kernel.puts(count) if count % 2 == 1
#     count += 1
#   end
# end

# Solution 2.
def odd_num
  100.times { |num| puts num if num.odd? }
end

# Solution.  Further Exploration.
# def odd_num
#   (1..99).to_a.select { |num| if num.odd? }
# end

# Solution 2.  Further Exploration.
# def odd_num
#   1.upto(99) do |num|
#     num.odd?
#   end
# end

p odd_num
