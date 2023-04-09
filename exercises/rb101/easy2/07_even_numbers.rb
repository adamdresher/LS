def even_num_to_99
  iterator = 1
  while iterator < 99
    Kernel.puts(iterator if iterator.even?)
    iterator += 1
  end
end

# Solution 2.
def even_num_to_99
  1.step(by: 1, to: 99) { |num| Kernel.puts(num) if num.even? }
end

p even_num_to_99
