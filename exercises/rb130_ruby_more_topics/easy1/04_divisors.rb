# def divisors(dividend)
#   valid_divisors = []

#   1.upto(dividend/2) do |divisor|
#     valid_divisors << divisor if (dividend % divisor == 0)
#   end

#   valid_divisors << dividend
# end

# def divisors(dividend)
#   1.upto(dividend/2).select { |divisor| dividend % divisor == 0 } << dividend
# end

def divisors(dividend) # by Max Tan
  valid_divisors = [1, dividend]

  2.upto(dividend/2) do |divisor|
    break if valid_divisors.include? divisor

    if (dividend % divisor == 0)
      valid_divisors << divisor
      valid_divisors << dividend / divisor
    end
  end

  valid_divisors.uniq.sort
end

def time_it # by Jason Wang
  start_time = Time.now
  yield if block_given?
  end_time = Time.now
  puts "took #{end_time - start_time} seconds"
end

# def divisors(num) # by Jason Wang
#   result = [1]
#   2.upto(Math.sqrt(num)) do |x|
#     result << x << num / x if num % x == 0
#   end
#   result.uniq.sort
# end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
time_it { p divisors(99400891) == [1, 9967, 9973, 99400891] }