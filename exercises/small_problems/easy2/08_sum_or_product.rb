# def compute_range

#   Kernel.puts('>> Please enter an integer greater than 0:')
#     num = gets.to_i
#     unless num.positive? then return Kernel.puts('<Invalid Input>') end
#     range = (1..num).to_a

#   Kernel.puts(">> Enter 's' to compute the sum, 'p' to compute the product:")
#     operator = gets.chomp
#     unless operator == 's' || operator == 'p'
#       return Kernel.puts('<Invalid Input>')
#     end

#   if operator == 's'
#     result = 0
#     range.each { |num| result += num }
#     Kernel.puts("The sum of the integers between 1 and #{num} is #{result}.")
#   else
#     result = 1
#     range.each { |num| result = result * num }
#     Kernel.puts("The product of the integers between 1 and #{num} is #{result}.")
#   end

# end

# Solution 2.
def compute_range
  operations = {
                's' => ['s', 'sum', 0],
                'p' => ['p', 'product', 1]
                }

  Kernel.puts('>> Please enter an integer greater than 0:')
    num = gets.to_i
    unless num.positive? then return Kernel.puts('<Invalid Input>') end
    range = (1..num).to_a

  Kernel.puts(">> Enter 's' to compute the sum, 'p' to compute the product:")
    operator = gets.chomp
    unless operator == 's' || operator == 'p'
      return Kernel.puts('<Invalid Input>')
    end

  if operations[operator][0] == 's'
    range.each { |num| operations[operator][2] += num }
  else
    range.each { |num| operations[operator][2] = operations[operator][2] * num }
  end

  Kernel.puts("The #{operations[operator][1]} of the integers between 1 and #{num} is #{operations[operator][2]}.")

end

compute_range
